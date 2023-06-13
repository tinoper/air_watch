import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:airwatch_app/airquality_status/airquality_status.dart';

void main() {
  group('AirQualityStatus Error', () {
    testWidgets('render correct text and monkey', (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AirQualityError(),
          ),
        ),
      );
      expect(find.text('Something went wrong!'), findsOneWidget);
      expect(find.text('🙈'), findsOneWidget);
    });
  });
}
