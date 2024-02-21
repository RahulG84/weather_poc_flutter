import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../model/weather_data_model.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherFetchEvent>(weatherFetchEvent);
  }

  FutureOr<void> weatherFetchEvent(
      WeatherFetchEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoadingState());
      var client = http.Client();
      var response = await client.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${event.locationName}&units=metric&appid=f3ba35f1e22cb767b8e4e56ba17bfeae'));
      print(response.body);
      if (response.statusCode == 200) {
        WeatherData weatherData =
            WeatherData.fromJson(jsonDecode(response.body));
        emit(WeatherSucessesState(weatherData: weatherData));
        print(weatherData.name);
      }
    } catch (error) {
      print('error $error');
    }
  }
}
