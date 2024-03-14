import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_poc/model/weather_data_model.dart';

class WeatherApi {
  static Future<WeatherData> fetchWeatherData(
      http.Client client, String cityName) async {
    final response = await client.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=f3ba35f1e22cb767b8e4e56ba17bfeae'));
    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('City not found');
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
