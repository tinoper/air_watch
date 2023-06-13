import 'package:airquality_repository/airquality_repository.dart';
import 'package:airwatch_app/airquality_status/airquality_status.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    AirQualityApp(),
  );
}

class AirQualityApp extends StatelessWidget {
  const AirQualityApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AirQualityView();
  }
}

class AirQualityView extends StatelessWidget {
  const AirQualityView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AirWatch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AirQualityPage(),
    );
  }
}
