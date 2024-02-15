import 'package:airwatch_app/airquality_status/airquality_status.dart';
import 'package:airwatch_app/airquality_status/models/airquality_status.dart';
import 'package:airwatch_app/airquality_status/view/widgets/custom_refresh.dart';
import 'package:flutter/material.dart';

import 'custom_background.dart';

class AirQualitySuccess extends StatelessWidget {
  const AirQualitySuccess({
    super.key,
    required this.airqualityStatus,
    required this.city,
  });

  final AirQualityStatus airqualityStatus;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.flag,
                size: 100,
                color: airqualityStatus.aqi < 50
                    ? Colors.green
                    : airqualityStatus.aqi > 100
                        ? Colors.red
                        : Colors.yellow,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                city,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'AirQuality Index: ${airqualityStatus.aqi}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomRefresh(),
            ],
          ),
        ),
      ],
    );
  }
}
