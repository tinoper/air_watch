import 'package:airwatch_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  try {
    await dotenv.load(fileName: "assets/.env");
  } catch (_) {}

  runApp(
    const AirQualityApp(),
  );
}
