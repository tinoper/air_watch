import 'dart:async';
import 'dart:convert';
import 'package:airquality_api/src/models/airquality_status.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when getAirQualityStatus request fails.
class AirQualityCityRequestFailure implements Exception {}

/// Exception thrown when City not found in API list.
class AirQualityCityNotFoundFailure implements Exception {}

/// Dart Api Client
class AirQualityApiClient {
  AirQualityApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrlAirQualityApiClient = 'api.waqi.info';

  final http.Client _httpClient;

  /// Fetches [AirQualityStatus]
  Future<AirQualityStatus> getAirQualityStatus({
    required token,
    required city,
  }) async {
    final airQualityStatusRequest = Uri.https(
      _baseUrlAirQualityApiClient,
      '/feed/$city/',
      {
        'token': token,
      },
    );

    final airQualityStatusResponse =
        await _httpClient.get(airQualityStatusRequest);

    if (airQualityStatusResponse.statusCode != 200) {
      throw AirQualityCityRequestFailure();
    }

    final bodyJson =
        jsonDecode(airQualityStatusResponse.body) as Map<String, dynamic>;

    if (bodyJson['status'] == "error") {
      throw AirQualityCityNotFoundFailure();
    }

    return AirQualityStatus.fromJson(bodyJson);
  }
}
