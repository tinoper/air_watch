import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:airwatch_app/airquality_status/airquality_status.dart';

void main() {
  group('AirQualityStatus Loading', () {
    testWidgets('show text and progressindicator', (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AirQualityLoading(),
          ),
        ),
      );
      expect(find.text('Loading AirQuality Data'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
