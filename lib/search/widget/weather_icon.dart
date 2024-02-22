import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const WeatherIcon({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 48.0, color: color);
  }
}
