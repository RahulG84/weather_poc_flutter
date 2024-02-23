import 'package:flutter/material.dart';
import 'package:weather_poc/model/city_name_data_model.dart';

import '../../weather/bloc/weather_bloc.dart';
import '../widget/weather_icon.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  WeatherBloc weatherBloc = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for a location'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: CityNameData.cityName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Enter your location',
                    hintText: 'Eg: Mumbai, Pune',
                    prefixIcon: const Icon(Icons.location_on),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            CityNameData.cityName.text = '';
                          },
                        );
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      weatherBloc.add(
                        WeatherFetchEvent(),
                      );
                      Navigator.pop(context, CityNameData.cityName.text);
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white.withOpacity(0.8),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 32.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                child: const Text(
                  'Fetch Weather',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherIcon(icon: Icons.wb_sunny, color: Colors.amber),
                  WeatherIcon(icon: Icons.cloud, color: Colors.grey),
                  WeatherIcon(icon: Icons.ac_unit, color: Colors.blue),
                  WeatherIcon(icon: Icons.whatshot, color: Colors.orange),
                  WeatherIcon(icon: Icons.opacity, color: Colors.lightBlue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
