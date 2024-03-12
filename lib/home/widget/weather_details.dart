import 'package:flutter/material.dart';

class WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;

  const WeatherDetail(
      {Key? key, required this.icon, required this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('weatherDetail_container'),
      width: 120,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48.0,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 8.0,
            key: Key(
              'weatherDetail_titleSizedBox',
            ),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8.0,
            key: Key(
              'weatherDetail_valueSizedBox',
            ),
          ),
          Text(
            value!,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
