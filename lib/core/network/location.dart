import 'package:geolocator/geolocator.dart';

abstract class GetLocation {
  static Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
