import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pusher_client_fixed/pusher_client_fixed.dart';
import 'package:time_attendance/core/constans/pusher_data.dart';
import 'package:time_attendance/features/menu/data/repos/logout%20repo/logout_repo_impl.dart';
import '../../../../../core/constans/database_constans.dart';
import '../../../../../core/helper/get_employee_data.dart';
import '../../../../../core/models/employee_model.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  late PusherClient pusher;
  late Channel channel;

  Future<void> initPusher() async {
    String token = GetEmployeeData().token;
    String id = GetEmployeeData().id.toString();
    pusher = PusherClient(
      key,
      enableLogging: true,
      autoConnect: false,
      PusherOptions(
        host: hostEndPoint,
        wssPort: 443,
        wsPort: 443,
        encrypted: true,
        auth: PusherAuth(
          hostAuthEndPoint,
          headers: {'Authorization': 'Bearer $token'},
        ),
      ),
    );

    pusher.connect();
    pusher.onConnectionStateChange((state) {
      log("current state : ${state?.currentState}\nSocket Id : ${pusher.getSocketId()}");
      if (state?.currentState == 'CONNECTED') {
        channel = pusher.subscribe("$channelName$id");

        channel.bind(eventName, (event) {
          print(event?.data);
          if (event == null) return;
          if (event.data == null) return;
          var jsonData = json.decode(event.data!);
          if (jsonData['message']['message'] == "Logout") {
            emit(LogoutListen());
          }
        });
      }
    });

    pusher.onConnectionError((error) {
      log("error: ${error?.message}");
    });
  }

  void disconnect() async {
    await pusher.disconnect();
  }

  Future<void> clearLocalDB() async {
    try {
      var box = Hive.box<EmployeeModel>(kEmployeeBox);
      var data1 = box.values.toList();
      for (int i = 0; i < data1.length; i++) {
        await data1[i].delete();
      }
      emit(LogoutSuccess());
    } on Exception catch (ex) {
      emit(LogoutFailure(errorMessage: ex.toString()));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    String token = GetEmployeeData().token;
    var result = await LogoutRepoImpl().logout(
      token: token,
    );
    result.fold(
      (failure) => emit(LogoutFailure(
        errorMessage: failure.errorMessage,
      )),
      (message) => clearLocalDB(),
    );
  }
}
