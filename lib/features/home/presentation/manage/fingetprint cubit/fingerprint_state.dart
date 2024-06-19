part of 'fingerprint_cubit.dart';

@immutable
sealed class FingerprintState {}

final class FingerprintInitial extends FingerprintState {}

final class FingerprintNotSupported extends FingerprintState {
  final String message;
  FingerprintNotSupported({required this.message});
}

final class FingerprintLoading extends FingerprintState {}

final class FingerprintSuccess extends FingerprintState {
  final String message;

  FingerprintSuccess({required this.message});
}

final class FingerprintFailure extends FingerprintState {
  final String errorMessage;

  FingerprintFailure({required this.errorMessage});
}
