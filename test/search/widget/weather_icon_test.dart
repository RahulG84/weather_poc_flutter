import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_poc/search/widget/weather_icon.dart';

void main() {
  testWidgets('Weather Icon Widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WeatherIcon(
          icon: Icons.wb_sunny,
          color: Colors.amber,
        ),
      ),
    );

    expect(find.byType(WeatherIcon), findsOneWidget);

    final weatherIconFinders = find.byType(WeatherIcon);
    final weatherIconWidget = tester.widget<WeatherIcon>(weatherIconFinders);
    expect(weatherIconWidget.color, Colors.amber);
    expect(weatherIconWidget.icon, Icons.wb_sunny);

    final weatherIconFinder = find.byKey(const Key('weatherIcon'));
    final weatherIcon = tester.widget<Icon>(weatherIconFinder);
    expect(weatherIcon.size, 48.00);
  });
}
