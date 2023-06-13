import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:airwatch_app/airquality_status/airquality_status.dart';

void main() {
  group('AirQuality Success', () {
    final airQualityStatus = AirqualityStatus(status: 'ok', aqi: 34);

    testWidgets('render success results', (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AirQualitySuccess(
              city: '',
              airqualityStatus: airQualityStatus,
            ),
          ),
        ),
      );
      expect(find.text('AirQuality Index: ${airQualityStatus.aqi}'),
          findsOneWidget);
    });
  });
}
