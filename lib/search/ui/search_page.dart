import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_poc/model/city_name_data_model.dart';
import '../../weather/bloc/weather_bloc.dart';
import '../widget/weather_icon.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> userLocationEntries = [];
  List<String> retrievedList = [];
  String locationKey = 'userLocation';
  WeatherBloc weatherBloc = WeatherBloc(client: http.Client());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userLocationEntries = prefs.getStringList(locationKey) ?? [];
    setState(() {});
  }

  Future<void> setUserLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(locationKey, userLocationEntries);
  }

  void onSubmit() {
    if (CityNameData.cityName.text.isNotEmpty) {
      setState(() {
        userLocationEntries.add(CityNameData.cityName.text);
      });
      setUserLocation();
      CityNameData.cityName.clear();
      print(userLocationEntries);
    }
  }

  void removeCityName(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    retrievedList = prefs.getStringList(locationKey)!;
    if (retrievedList.isNotEmpty) {
      setState(() {
        retrievedList.removeAt(index);
        userLocationEntries = retrievedList;
      });
      prefs.setStringList(locationKey, retrievedList);
    }
  }

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
                      Navigator.pop(
                        context,
                        CityNameData.cityName.text,
                      );
                      onSubmit();
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
              const SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: userLocationEntries.length,
                  itemBuilder: (context, index) {
                    String locationName = userLocationEntries[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (CityNameData.cityName.text !=
                                    locationName) {
                                  CityNameData.cityName.text = locationName;
                                }
                                Navigator.pop(
                                  context,
                                  CityNameData.cityName.text,
                                );
                              },
                              child: Text(
                                locationName.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                removeCityName(index);
                              },
                              child: const Icon(Icons.delete_outlined),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
