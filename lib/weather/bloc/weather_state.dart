part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

sealed class WeatherActionState extends WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherSucessesState extends WeatherState {
  final WeatherData? weatherData;
  WeatherSucessesState({
    this.weatherData,
  });
}

final class WeatherErrorState extends WeatherState {
  final String? error;
  WeatherErrorState({
    this.error,
  });
}
