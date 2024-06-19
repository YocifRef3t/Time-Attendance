part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UploadImageLoading extends ProfileState {}

final class UploadImageSuccess extends ProfileState {
  final String message;
  UploadImageSuccess({required this.message});
}

final class UploadImageFailure extends ProfileState {
  final String errorMessage;
  UploadImageFailure({required this.errorMessage});
}

final class PickImageSuccess extends ProfileState {
  final File image;
  PickImageSuccess({required this.image});
}

final class PickImageFailure extends ProfileState {
  final String errorMessage;
  PickImageFailure({required this.errorMessage});
}
