// ignore_for_file: unused_catch_clause

import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance/core/errors/failure.dart';
import 'package:time_attendance/core/helper/api.dart';
import 'package:time_attendance/features/menu/data/repos/profile%20repo/profile_repo.dart';
import '../../../../../core/constans/api_constance.dart';
import '../../../../../core/constans/database_constans.dart';
import '../../../../../core/helper/translator.dart';
import '../../../../../core/models/profile_data.dart';
import '../../../../../core/utls/app_router.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failure, File>> pickImage({required ImageSource source}) async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        File image = File(pickedImage.path);
        return right(image);
      } else {
        return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).cancelImage
              : 'Select image has been canceled',
        ));
      }
    } on Exception catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(
      {required String token, required File photo}) async {
    try {
      FormData formData = FormData.fromMap({
        'lang': Intl.getCurrentLocale(),
        'photo': await MultipartFile.fromFile(
          photo.path,
        ),
      });
      Response response = await Api()
          .post(endPoint: uploadProfileImage, body: formData, headers: {
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == 400) {
          return left(Failure(errorMessage: data['messages']));
        } else {
          var box = Hive.box<ProfileDataModel>(kProfileDateBox);
          var boxData = box.values.toList();
          boxData[0].employeeImage = data['employeeImage'];
          boxData[0].save();
          return right(data['messages']);
        }
      } else {
        return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later",
        ));
      }
    } on DioException catch (ex) {
      return left(Failure.serverError(ex));
    } catch (ex) {
      return left(Failure(
          errorMessage: AppRouter.navKey.currentContext != null
              ? translator(AppRouter.navKey.currentContext!).oopsMessage
              : "Oops there was an error ,please try again later"));
    }
  }
}
