import 'package:geolocator/geolocator.dart';
class Location{
  double latitude;
  double longitude;
  Future getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    try{
      Position position = await Geolocator.getLastKnownPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e)
    {
      print("Nahi hua load");
      latitude = 0.0;
      longitude = 0.0;
    }
  }

}