import 'package:weather_poc/model/weather_data_model.dart';

class MockWeatherData {
  static final Map<String, dynamic> weatherDataJson = {
    "coord": {"lon": 73.8553, "lat": 18.5196},
    "weather": [
      {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
    ],
    "base": "stations",
    "main": {
      "temp": 36.19,
      "feels_like": 33.78,
      "temp_min": 36.19,
      "temp_max": 36.19,
      "pressure": 1012,
      "humidity": 15,
      "sea_level": 1012,
      "grnd_level": 952
    },
    "visibility": 10000,
    "wind": {"speed": 2.08, "deg": 297, "gust": 4.69},
    "clouds": {"all": 0},
    "dt": 1710234152,
    "sys": {"country": "IN", "sunrise": 1710206112, "sunset": 1710249214},
    "timezone": 19800,
    "id": 1259229,
    "name": "Pune",
    "cod": 200
  };

  static WeatherData getWeatherData() {
    return WeatherData.fromJson(weatherDataJson);
  }
}
