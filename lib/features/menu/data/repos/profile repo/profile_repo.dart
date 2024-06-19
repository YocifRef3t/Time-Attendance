import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, File>> pickImage({required ImageSource source});

  Future<Either<Failure, String>> uploadImage({
    required String token,
    required File photo,
  });
}
