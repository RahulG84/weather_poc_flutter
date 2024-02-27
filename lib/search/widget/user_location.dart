import 'package:shared_preferences/shared_preferences.dart';

class UserLocation {
   List<String> userLocation = [];
   String locationKey = 'userLocation';
  // SharedPreferences prefs =
  //     SharedPreferences.getInstance() as SharedPreferences;

   Future<void> getUserLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userLocation = prefs.getStringList(locationKey) ?? [];
  }

   Future<void> setUserLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(locationKey, userLocation);
  }
}
