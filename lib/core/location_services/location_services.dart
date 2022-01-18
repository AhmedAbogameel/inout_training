import 'package:geolocator/geolocator.dart';

class LocationServices {

  static Position? currentPosition;

  static Future<void> getCurrentLocation() async {
    try{
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied, we cannot request permissions.');
      }
      currentPosition = await Geolocator.getCurrentPosition();
    } catch(e){
      print(e);
    }
  }

}