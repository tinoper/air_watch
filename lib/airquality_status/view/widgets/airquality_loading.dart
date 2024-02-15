import 'package:flutter/material.dart';

class AirQualityLoading extends StatelessWidget {
  const AirQualityLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        ),
        Text(
          'Loading AirQuality Data',
          style: TextStyle(fontSize: 30),
        )
      ],
    );
  }
}
