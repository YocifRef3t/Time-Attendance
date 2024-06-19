import 'package:date_format/date_format.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_attendance/core/network/notifications.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';
import '../../../data/models/home_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String? date;

  void picDate({required DateTime date}) => emit(PickDate(date: date));

  void listenToNotification() {
    FirebaseMessaging.onMessage.listen((event) {
      notificationsCounter1++;
      emit(NotificationCounterIncreased());
    });
  }

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    var result = await HomeRepoImpl().fetchHomeData(
        date: date ?? formatDate(DateTime.now(), [yyyy, '-', mm]));
    result.fold(
      (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
      (homeModel) => emit(HomeSuccess(homeModel: homeModel)),
    );
  }
}
