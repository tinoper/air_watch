import 'dart:math';

import 'package:airquality_repository/airquality_repository.dart'
    show AirQualityRepository;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/airquality_status.dart';

part 'airquality_status_state.dart';

class AirqualityStatusCubit extends Cubit<AirqualityStatusState> {
  AirqualityStatusCubit(this._airQualityRepository)
      : super(AirqualityStatusState());

  final AirQualityRepository _airQualityRepository;

  void getAirQualityStatus(String city) async {
    String apiToken = dotenv.env['API_TOKEN'] ?? '';

    if (city.isEmpty) {
      Random random = Random();
      city = cities[random.nextInt(cities.length)];
    }

    emit(
      state.copyWith(
        airQualityStatusEnum: AirQualityStatusEnum.loading,
      ),
    );

    try {
      final airQualityStatus = AirQualityStatus.fromRepository(
        await _airQualityRepository.getAirQualityStatus(
          city,
          apiToken,
        ),
      );
      emit(
        state.copyWith(
          airQualityStatus: airQualityStatus,
          airQualityStatusEnum: AirQualityStatusEnum.success,
          choosenCity: city,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          airQualityStatusEnum: AirQualityStatusEnum.failure,
        ),
      );
    }
  }

  void getAnotherCity() {
    emit(
      state.copyWith(
        airQualityStatusEnum: AirQualityStatusEnum.initial,
        choosenCity: '',
      ),
    );
  }

  List<String> cities = [
    'Roma',
    'Barcelona',
    'Santiago de Chile',
    'Ciudad de Mexico',
    'Sao Paulo',
    'Los Angeles',
    'Denver',
    'Texas',
    'Montevideo',
    'Tokyo',
    'Beijing',
    'London',
  ];
}
