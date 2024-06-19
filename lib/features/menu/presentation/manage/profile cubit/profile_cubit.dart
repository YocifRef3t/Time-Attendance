import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/features/menu/data/repos/profile%20repo/profile_repo_impl.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> pickedImage({required ImageSource source}) async {
    var result = await ProfileRepoImpl().pickImage(source: source);
    result.fold(
      (failure) => emit(PickImageFailure(errorMessage: failure.errorMessage)),
      (image) => emit(PickImageSuccess(image: image)),
    );
  }

  Future<void> uploadImage({required File photo}) async {
    emit(UploadImageLoading());
    String token = GetEmployeeData().token;
    var result = await ProfileRepoImpl().uploadImage(
      token: token,
      photo: photo,
    );
    result.fold(
      (failure) => emit(UploadImageFailure(errorMessage: failure.errorMessage)),
      (message) => emit(UploadImageSuccess(message: message)),
    );
  }
}
