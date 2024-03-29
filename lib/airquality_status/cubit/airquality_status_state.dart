part of 'airquality_status_cubit.dart';

enum AirQualityStatusEnum { initial, loading, success, failure }

class AirqualityStatusState extends Equatable {
  AirqualityStatusState({
    this.airQualityStatusEnum = AirQualityStatusEnum.initial,
    AirQualityStatus? airQualityStatus,
    this.choosenCity = '',
  }) : airQualityStatus = airQualityStatus ?? AirQualityStatus.empty;

  final AirQualityStatus airQualityStatus;
  final AirQualityStatusEnum airQualityStatusEnum;
  final String choosenCity;

  AirqualityStatusState copyWith({
    AirQualityStatus? airQualityStatus,
    AirQualityStatusEnum? airQualityStatusEnum,
    String? choosenCity,
  }) {
    return AirqualityStatusState(
      airQualityStatus: airQualityStatus ?? this.airQualityStatus,
      airQualityStatusEnum: airQualityStatusEnum ?? this.airQualityStatusEnum,
      choosenCity: choosenCity ?? this.choosenCity,
    );
  }

  @override
  List<Object?> get props => [
        airQualityStatus,
        airQualityStatusEnum,
        choosenCity,
      ];
}
