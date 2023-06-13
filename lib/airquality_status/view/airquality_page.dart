import 'package:airquality_repository/airquality_repository.dart';
// import 'package:airwatch_app/airquality_status/cubit/cubit/airquality_status_cubit.dart';
import 'package:airwatch_app/airquality_status/view/widgets/airquality_empty.dart';
import 'package:airwatch_app/airquality_status/view/widgets/airquality_error.dart';
import 'package:airwatch_app/airquality_status/view/widgets/airquality_loading.dart';
import 'package:airwatch_app/airquality_status/view/widgets/airquality_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/airquality_status_cubit.dart';

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AirqualityStatusCubit(AirQualityRepository()),
      child: const ApiQualityView(),
    );
  }
}

class ApiQualityView extends StatelessWidget {
  const ApiQualityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AirQuality Watch'),
      ),
      body: Center(
          child: BlocConsumer<AirqualityStatusCubit, AirqualityStatusState>(
        listener: (context, state) => (
          // TODO: Shows SnackBar error
        ),
        builder: (context, state) {
          switch (state.airQualityStatusEnum) {
            case AirQualityStatusEnum.initial:
              return const AirQualityEmpty();
            case AirQualityStatusEnum.loading:
              return const AirQualityLoading();
            case AirQualityStatusEnum.success:
              return AirQualitySuccess(
                  airqualityStatus: state.airQualityStatus);
            case AirQualityStatusEnum.failure:
              return const AirQualityError();
          }
        },
      )),
    );
  }
}
