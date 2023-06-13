part of 'airquality_status_cubit.dart';

enum AirQualityStatusEnum { initial, loading, success, failure }

class AirqualityStatusState extends Equatable {
  AirqualityStatusState({
    this.airQualityStatusEnum = AirQualityStatusEnum.initial,
    AirqualityStatus? airQualityStatus,
  }) : airQualityStatus = airQualityStatus ?? AirqualityStatus.empty;

  final AirqualityStatus airQualityStatus;
  final AirQualityStatusEnum airQualityStatusEnum;

  AirqualityStatusState copyWith({
    AirqualityStatus? airQualityStatus,
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
