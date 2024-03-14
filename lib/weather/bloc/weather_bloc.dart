import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_poc/model/city_name_data_model.dart';
import '../../model/weather_data_model.dart';
import '../../utils/weather_service.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  http.Client client;
  WeatherBloc({required this.client}) : super(WeatherInitial()) {
    on<WeatherFetchEvent>(weatherFetchEvent);
  }
  FutureOr<void> weatherFetchEvent(
      WeatherFetchEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoadingState());
      // await Future.delayed(const Duration(seconds: 2));
      final weatherData =
          await WeatherApi.fetchWeatherData(client, CityNameData.cityName.text);
      emit(WeatherSucessesState(weatherData: weatherData));
    } catch (error) {
      emit(WeatherErrorState(error: error.toString()));
    }
  }
}
