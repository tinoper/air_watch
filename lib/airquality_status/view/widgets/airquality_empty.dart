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
          "🫙",
          style: TextStyle(fontSize: 60),
        ),
        const Text(
          'Show AirQuality City',
          style: TextStyle(fontSize: 30),
        ),
        IconButton(
          onPressed: () => context
              .read<AirqualityStatusCubit>()
              .getAirQualityStatus('Mexico'),
          icon: Icon(Icons.shuffle_on),
        ),
      ],
    );
  }
}
