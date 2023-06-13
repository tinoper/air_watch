import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/airquality_status_cubit.dart';

class CustomRefresh extends StatelessWidget {
  const CustomRefresh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<AirqualityStatusCubit>().getAnotherCity(),
      icon: const Icon(
        Icons.refresh,
        size: 40,
      ),
    );
  }
}
