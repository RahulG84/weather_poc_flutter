import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:weather_poc/model/city_name_data_model.dart';
import 'package:weather_poc/model/mock_weather_data.dart';
import 'package:weather_poc/model/weather_data_model.dart';
import 'package:weather_poc/utils/weather_service.dart';
import '../weather/bloc/weather_bloc_test.mocks.dart';

final url =
    'https://api.openweathermap.org/data/2.5/weather?q=${CityNameData.cityName.text}&units=metric&appid=f3ba35f1e22cb767b8e4e56ba17bfeae';

@GenerateMocks([http.Client])
void main() {
  group('WeatherApi Service', () {
    test(
        'returns the correct weather data if the http call completes successfully',
        () async {
      final client = MockClient();
      when(client.get(Uri.parse(url))).thenAnswer((_) async =>
          http.Response(json.encode(MockWeatherData.weatherDataJson), 200));

      final expectedWeatherData =
          WeatherData.fromJson(MockWeatherData.weatherDataJson);
      final actualWeatherData =
          await WeatherApi.fetchWeatherData(client, 'pune');

      expect(actualWeatherData.name, expectedWeatherData.name);
      expect(actualWeatherData.wind?.speed, expectedWeatherData.wind?.speed);
      expect(
          actualWeatherData.weather?[0].id, expectedWeatherData.weather?[0].id);
    });

    test('returns an weather data if the http call completes successfully',
        () async {
      final client = MockClient();
      when(client.get(Uri.parse(url))).thenAnswer((_) async =>
          http.Response(json.encode(MockWeatherData.weatherDataJson), 200));

      expect(await WeatherApi.fetchWeatherData(client, 'pune'),
          isA<WeatherData>());
    });
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();
    when(client.get(Uri.parse(url)))
        .thenAnswer((_) async => http.Response('city not found', 404));

    expect(WeatherApi.fetchWeatherData(client, CityNameData.cityName.text),
        throwsException);
  });
}
