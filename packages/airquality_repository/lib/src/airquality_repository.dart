import 'dart:async';

import 'package:airquality_api/airquality_api.dart' hide AirqualityStatus;
import 'package:airquality_repository/airquality_repository.dart';

class AirQualityRepository {
  AirQualityRepository({AirQualityApiClient? airQualityApiClient})
      : _airQualityApiClient = airQualityApiClient ?? AirQualityApiClient();

  final AirQualityApiClient _airQualityApiClient;

  Future<AirqualityStatus> getAirQualityStatus(String city) async {
    final airquality = await _airQualityApiClient.getAirQualityStatus(
      city: city,
    );
    return AirqualityStatus(
      status: airquality.status,
      aqi: airquality.data.aqi,
    );
  }
}
