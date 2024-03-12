import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_poc/home/widget/weather_details.dart';

void main() {
  testWidgets(
    'WeatherDetail widget test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: WeatherDetail(
            icon: Icons.cloud,
            title: 'Cloudy',
            value: '25°C',
          ),
        ),
      );

      expect(find.byType(WeatherDetail), findsOneWidget);
      expect(find.text('25°C'), findsOneWidget);
      expect(find.text('Cloudy'), findsOneWidget);

      final iconFinder = find.byIcon(Icons.cloud);
      final icon = tester.widget<Icon>(iconFinder);
      expect(icon.size, 48.0);

      final textFinder = find.text('Cloudy');
      final text = tester.widget<Text>(textFinder);
      expect(text.style?.fontSize, 16.0);
      expect(text.style?.color, Colors.white);

      final titleSizedBoxFinder =
          find.byKey(const Key('weatherDetail_titleSizedBox'));
      final titleSizedBox = tester.widget<SizedBox>(titleSizedBoxFinder);
      expect(titleSizedBox.height, 8.0);

      final valueSizedBoxFinder =
          find.byKey(const Key('weatherDetail_valueSizedBox'));
      final valueSizedBox = tester.widget<SizedBox>(valueSizedBoxFinder);
      expect(valueSizedBox.height, 8.0);

      final containerFinder = find.byKey(const Key('weatherDetail_container'));
      final container = tester.widget<Container>(containerFinder);
      expect(container.margin, const EdgeInsets.symmetric(horizontal: 8.0));
      expect(container.padding, const EdgeInsets.all(16.0));
      expect(
        container.decoration,
        BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
      );
    },
  );
}
