part of 'airquality_status_cubit.dart';

enum AirQualityStatusEnum { initial, loading, success, failure }

class AirqualityStatusState extends Equatable {
  const AirqualityStatusState(
      {this.airQualityStatusEnum = AirQualityStatusEnum.initial,
      this.airQualityStatus});

  final AirqualityStatus? airQualityStatus;
  final AirQualityStatusEnum airQualityStatusEnum;

  AirqualityStatusState copyWith({
    AirqualityStatus? airqualityStatus,
    AirQualityStatusEnum? airQualityStatusEnum,
  }) {
    return AirqualityStatusState(
      airQualityStatus: airQualityStatus ?? this.airQualityStatus,
      airQualityStatusEnum: airQualityStatusEnum ?? this.airQualityStatusEnum,
    );
  }

  @override
  List<Object?> get props => [airQualityStatus, airQualityStatusEnum];
}
