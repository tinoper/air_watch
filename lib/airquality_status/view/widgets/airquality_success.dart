import 'package:airwatch_app/airquality_status/models/airquality_status.dart';
import 'package:flutter/material.dart';

class AirQualitySuccess extends StatelessWidget {
  const AirQualitySuccess({
    super.key,
    required this.airqualityStatus,
  });

  final AirqualityStatus airqualityStatus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'AirQuality Index: ${airqualityStatus.aqi}',
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
