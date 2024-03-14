import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_poc/model/city_name_data_model.dart';
import 'package:weather_poc/model/weather_data_model.dart';
import 'package:weather_poc/weather/bloc/weather_bloc.dart';
import 'weather_bloc_test.mocks.dart';

@GenerateMocks([http.Client])
final url =
    'https://api.openweathermap.org/data/2.5/weather?q=${CityNameData.cityName.text}&units=metric&appid=f3ba35f1e22cb767b8e4e56ba17bfeae';
void main() {
  group('Weather Bloc', () {
    late MockClient client;

    final mockResponse = {
      "coord": {"lon": 73.8553, "lat": 18.5196},
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "base": "stations",
      "main": {
        "temp": 33.75,
        "feels_like": 31.24,
        "temp_min": 33.75,
        "temp_max": 33.75,
        "pressure": 1012,
        "humidity": 10,
        "sea_level": 1012,
        "grnd_level": 953
      },
      "visibility": 10000,
      "wind": {"speed": 2.49, "deg": 326, "gust": 4.95},
      "clouds": {"all": 0},
      "dt": 1710402946,
      "sys": {"country": "IN", "sunrise": 1710378815, "sunset": 1710422043},
      "timezone": 19800,
      "id": 1259229,
      "name": "Pune",
      "cod": 200
    };

    setUp(() {
      client = MockClient();
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits WeatherLoadingState, WeatherSuccessState  when WeatherFetchEvent is added successfully',
      build: () {
        when(client.get(Uri.parse(url))).thenAnswer(
          (_) async => http.Response(json.encode(mockResponse), 200),
        );
        return WeatherBloc(client: client);
      },
      act: (bloc) => bloc.add(WeatherFetchEvent()),
      verify: (bloc) {
        expect(bloc.state.runtimeType, WeatherSucessesState);
      },
      expect: () => [
        isA<WeatherLoadingState>(),
        isA<WeatherSucessesState>(),
        // WeatherLoadingState(),
        // WeatherSucessesState(weatherData: WeatherData.fromJson(mockResponse)),
      ],
    );
    blocTest<WeatherBloc, WeatherState>(
      'emits WeatherLoadingState, WeatherErrorState when WeatherFetchEvent fails',
      build: () {
        // Mock client to throw an error
        when(client.get(Uri.parse(url))).thenThrow(Exception('City not found'));
        return WeatherBloc(client: client);
      },
      act: (bloc) => bloc.add(WeatherFetchEvent()),
      expect: () => [
        isA<WeatherLoadingState>(),
        isA<WeatherErrorState>(),
      ],
    );
  });
}
