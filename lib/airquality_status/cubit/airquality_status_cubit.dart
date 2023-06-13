import 'package:airquality_repository/airquality_repository.dart'
    show AirQualityRepository;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/airquality_status.dart';

// import '../../models/airquality_status.dart';

part 'airquality_status_state.dart';

class AirqualityStatusCubit extends Cubit<AirqualityStatusState> {
  AirqualityStatusCubit(this._airQualityRepository)
      : super(AirqualityStatusState());

  final AirQualityRepository _airQualityRepository;

  void getAirQualityStatus(String city) async {
    if (city.isEmpty) return;

    emit(state.copyWith(airQualityStatusEnum: AirQualityStatusEnum.loading));

    try {
      final airQualityStatus = AirqualityStatus.fromRepository(
        await _airQualityRepository.getAirQualityStatus(city),
      );
      emit(
        state.copyWith(
          airQualityStatus: airQualityStatus,
          airQualityStatusEnum: AirQualityStatusEnum.success,
          choosenCity: city,
        ),
      );
    } on Exception {
      emit(state.copyWith(airQualityStatusEnum: AirQualityStatusEnum.failure));
    }
  }

  void getAnotherCity() {
    emit(state.copyWith(
      airQualityStatusEnum: AirQualityStatusEnum.initial,
      choosenCity: '',
    ));
  }
}
