import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ntp/ntp.dart';
import 'package:time_attendance/core/helper/get_employee_data.dart';
import 'package:time_attendance/core/helper/translator.dart';
import 'package:time_attendance/core/network/location.dart';
import 'package:time_attendance/core/utls/app_router.dart';
import 'package:time_attendance/features/home/data/repos/home_repo_impl.dart';
part 'fingerprint_state.dart';

class FingerprintCubit extends Cubit<FingerprintState> {
  FingerprintCubit() : super(FingerprintInitial());
  LocalAuthentication auth = LocalAuthentication();
  DateTime? now;
  String? localTime;
  String? time;
  String? date;
  Future<bool> _checkDeveloperOptions() async {
    bool developerMode;
    try {
      developerMode = await FlutterJailbreakDetection.developerMode;
    } on PlatformException {
      developerMode = true;
    }
    return developerMode;
  }

  Future<bool> _checkSupport() async {
    return await auth.isDeviceSupported();
  }

  Future<bool> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason:
            "Scan your fingerprint (or face or whatever) to authenticate",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (ex) {
      emit(FingerprintFailure(
        errorMessage: ex.message ?? "There was an error",
      ));
      return false;
    }
  }

  Future<void> setAttendance() async {
    if (await _checkSupport() && !await _checkDeveloperOptions()) {
      if (await _authenticate()) {
        emit(FingerprintLoading());
        String token = GetEmployeeData().token;
        Position position = await GetLocation.getPosition();
        String deviceIp = await FlutterUdid.consistentUdid;
        await _getTime();
        var result = await HomeRepoImpl().sendAttendance(
          token: token,
          longitude: position.longitude.toString(),
          latitude: position.latitude.toString(),
          date: date!,
          time: time!,
          deviceIp: deviceIp,
        );
        result.fold(
          (failure) =>
              emit(FingerprintFailure(errorMessage: failure.errorMessage)),
          (message) => emit(FingerprintSuccess(message: message)),
        );
      } else {
        if (AppRouter.navKey.currentContext == null) {
          emit(FingerprintFailure(
            errorMessage: "Fingerprint registration has been canceled",
          ));
        } else {
          emit(FingerprintFailure(
            errorMessage: translator(AppRouter.navKey.currentContext!)
                .fingerprintCanceled,
          ));
        }
      }
    } else {
      if (AppRouter.navKey.currentContext == null) {
        emit(FingerprintFailure(
          errorMessage: "Fingerprint registration has been canceled",
        ));
      } else {
        emit(FingerprintFailure(
          errorMessage:
              translator(AppRouter.navKey.currentContext!).notSupported,
        ));
      }
    }
  }

  _getTime() async {
    now = await Intl.withLocale('en', () => NTP.now());
    localTime = await Intl.withLocale(
        'en', () => DateFormat.yMd().add_jm().format(now!));
    time = await Intl.withLocale('en', () => DateFormat.Hms().format(now!));
    date = await Intl.withLocale(
        'en', () => DateFormat("yyyy-MM-dd").format(now!));
  }
}
