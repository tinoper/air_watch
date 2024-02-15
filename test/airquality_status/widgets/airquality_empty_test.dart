import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:airwatch_app/airquality_status/airquality_status.dart';

void main() {
  group('AirQualityStatus Empty', () {
    testWidgets('render text and dice', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AirQualityEmpty(),
          ),
        ),
      );
      expect(find.text('Show AirQuality City'), findsOneWidget);
      expect(find.text('🎲'), findsOneWidget);
    });
  });
}
