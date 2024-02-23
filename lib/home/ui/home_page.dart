import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_poc/search/ui/search_page.dart';
import 'package:weather_poc/utils/utils.dart';
import '../../model/city_name_data_model.dart';
import '../../weather/bloc/weather_bloc.dart';
import '../widget/weather_details.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherBloc weatherBloc = WeatherBloc();
  String backgroundImageURL = "";
  DateTime now = DateTime.now();
  String currentDay = DateFormat('EEEE').format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherBloc.add(WeatherFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: const Text(
          'Weather Forecast',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    CityNameData.cityName.text = value as String;
                    weatherBloc.add(WeatherFetchEvent());
                  });
                }
              });
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        bloc: weatherBloc,
        listenWhen: (previous, current) => current is WeatherActionState,
        buildWhen: (previous, current) => current is! WeatherActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WeatherLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case WeatherSucessesState:
              final successState = state as WeatherSucessesState;
              final String? weatherId =
                  successState.weatherData!.weather![0]?.main;
              if (weatherId != null) {
                backgroundImageURL = Utils.getBackgroundImageURL(weatherId)!;
              }
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(backgroundImageURL!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${successState.weatherData!.name} , ${successState.weatherData!.sys!.country}',
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${successState.weatherData!.main!.temp} °C'
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WeatherDetail(
                                icon: Icons.ac_unit,
                                title: 'Wind',
                                value:
                                    '${successState.weatherData!.wind!.speed} m/s'),
                            WeatherDetail(
                              icon: Icons.whatshot,
                              title: 'Humidity',
                              value:
                                  '${successState.weatherData!.main!.humidity} %',
                            ),
                            WeatherDetail(
                              icon: Icons.arrow_circle_down_outlined,
                              title: 'Pressure',
                              value:
                                  '${successState.weatherData!.main!.pressure} hPa',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WeatherDetail(
                              icon: Icons.thermostat_outlined,
                              title: 'Min. Temp',
                              value:
                                  '${successState.weatherData!.main!.tempMax} °C ',
                            ),
                            WeatherDetail(
                              icon: Icons.wb_sunny,
                              title: 'Max. Temp',
                              value:
                                  '${successState.weatherData!.main!.tempMax} °C',
                            ),
                            WeatherDetail(
                              icon: Icons.cloud_outlined,
                              title: 'Clouds',
                              value:
                                  '${successState.weatherData!.clouds!.all} %',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WeatherDetail(
                                icon: Icons.place,
                                title: 'Longitude',
                                value:
                                    '${successState.weatherData!.coord!.lon}'),
                            WeatherDetail(
                              icon: Icons.location_on_outlined,
                              title: 'Latitude',
                              value:
                                  '${successState.weatherData!.coord!.lat}',
                            ),
                            WeatherDetail(
                              icon: Icons.description,
                              title: 'Description',
                              value:
                                  '${ successState.weatherData!.weather![0]?.description}',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Center(
                          child: Text(
                            '$currentDay ${now.day} / ${now.month} / ${now.year}',
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            case WeatherErrorState:
              return const Center(
                  child: Text('city not found try different city..'));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
