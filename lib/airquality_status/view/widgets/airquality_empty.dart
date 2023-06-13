// import 'package:airwatch_app/airquality_status/cubit/cubit/airquality_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/airquality_status_cubit.dart';

class AirQualityEmpty extends StatelessWidget {
  const AirQualityEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Show AirQuality City',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () =>
              context.read<AirqualityStatusCubit>().getAirQualityStatus('Roma'),
          child: const Text(
            "🎲",
            style: TextStyle(fontSize: 100),
          ),
        ),
      ],
    );
  }
}
