import 'package:geolocator/geolocator.dart';

class Location {
  double _lat;
  double _long;

  get lat {
    return _lat;
  }

  get long {
    return _long;
  }

  Future getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _lat = position.latitude;
    _long = position.longitude;
  }
}
