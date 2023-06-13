import 'package:flutter/material.dart';

class AirQualityError extends StatelessWidget {
  const AirQualityError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'Something went wrong!',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
