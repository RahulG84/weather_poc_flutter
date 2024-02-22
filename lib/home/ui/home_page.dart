import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_poc/weather/bloc/weather_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  WeatherBloc weatherBloc = WeatherBloc();
  TextEditingController cityNameController =
      TextEditingController(text: 'Pune');

  @override
  void initState() {
    super.initState();
    weatherBloc.add(WeatherFetchEvent(locationName: cityNameController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cityNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Enter your location',
                    hintText: 'Eg: Mumbai, Pune',
                    prefixIcon: const Icon(Icons.location_on),
                  ),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      weatherBloc.add(
                        WeatherFetchEvent(
                            locationName: cityNameController.text),
                      );
                    }
                  },
                  child: const Text('Fetch Weather'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
