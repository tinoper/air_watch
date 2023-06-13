import 'package:flutter/material.dart';

class AirQualityLoading extends StatelessWidget {
  const AirQualityLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        ),
        const Text(
          'Loading AirQuality Data',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
