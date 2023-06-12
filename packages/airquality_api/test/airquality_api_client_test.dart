import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:airquality_api/airquality_api.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('AirQualityApiClient', () {
    late http.Client httpClient;
    late AirQualityApiClient apiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      apiClient = AirQualityApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(AirQualityApiClient(), isNotNull);
      });
    });

    group('getAirQualityStatus', () {
      const city = 'Roma';

      test('correct http request is done', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        try {
          await apiClient.getAirQualityStatus(city: city);
        } catch (_) {}

        verify(
          () => httpClient.get(
            Uri.https('api.waqi.info', '/feed', {
              'city': '$city',
            }),
          ),
        ).called(1);
      });

      test('throws AirQualityCityRequestFailure', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => apiClient.getAirQualityStatus(
            city: city,
          ),
          throwsA(isA<AirQualityCityRequestFailure>()),
        );
      });

      test('throws AirQualityCityNotFoundFailure', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        // when(() => response.body).thenReturn('{"status": "error"}');
        when(() => response.body)
            .thenReturn('{"status": "error", "data": "Unknown station"}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => apiClient.getAirQualityStatus(
            city: city,
          ),
          throwsA(isA<AirQualityCityNotFoundFailure>()),
        );
      });

      test('Returns AirQualityStatus valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('''{
           "status": "ok",
          "data": {
            "aqi": 34,
            "idx": 9352,
            "attributions": [
              {
                "url": "http://www.arpalazio.net/",
                "name": "ARAP Lazio - Agenzia Regionale per la Protezione dell'Ambiente del Lazio)",
                "logo": "Italy-Arpa-Lazio.png"
              },
              {
                "url": "https://waqi.info/",
                "name": "World Air Quality Index Project"
              }
            ],
            "city": {
              "geo": [
                41.8932669,
                12.4753855
              ],
              "name": "Arenula, Roma, Lazio, Italy",
              "url": "https://aqicn.org/city/italy/lazio/roma/arenula",
              "location": ""
            },
            "dominentpol": "pm25",
            "iaqi": {
              "h": {
                "v": 38
              },
              "no2": {
                "v": 7.8
              },
              "o3": {
                "v": 14.3
              },
              "p": {
                "v": 1006.3
              },
              "pm10": {
                "v": 10
              },
              "pm25": {
                "v": 34
              },
              "t": {
                "v": 31.1
              }
            },
            "time": {
              "s": "2023-06-11 23:00:00",
              "tz": "+02:00",
              "v": 1686524400,
              "iso": "2023-06-11T23:00:00+02:00"
            },
            "forecast": {
              "daily": {
                "o3": [
                  {
                    "avg": 31,
                    "day": "2023-06-12",
                    "max": 47,
                    "min": 15
                  },
                  {
                    "avg": 31,
                    "day": "2023-06-13",
                    "max": 47,
                    "min": 16
                  },
                  {
                    "avg": 30,
                    "day": "2023-06-14",
                    "max": 40,
                    "min": 17
                  },
                  {
                    "avg": 27,
                    "day": "2023-06-15",
                    "max": 42,
                    "min": 17
                  },
                  {
                    "avg": 23,
                    "day": "2023-06-16",
                    "max": 24,
                    "min": 23
                  }
                ],
                "pm10": [
                  {
                    "avg": 11,
                    "day": "2023-06-12",
                    "max": 16,
                    "min": 6
                  },
                  {
                    "avg": 11,
                    "day": "2023-06-13",
                    "max": 16,
                    "min": 7
                  },
                  {
                    "avg": 9,
                    "day": "2023-06-14",
                    "max": 15,
                    "min": 6
                  },
                  {
                    "avg": 8,
                    "day": "2023-06-15",
                    "max": 11,
                    "min": 6
                  },
                  {
                    "avg": 10,
                    "day": "2023-06-16",
                    "max": 10,
                    "min": 8
                  }
                ],
                "pm25": [
                  {
                    "avg": 40,
                    "day": "2023-06-12",
                    "max": 58,
                    "min": 25
                  },
                  {
                    "avg": 42,
                    "day": "2023-06-13",
                    "max": 57,
                    "min": 25
                  },
                  {
                    "avg": 34,
                    "day": "2023-06-14",
                    "max": 56,
                    "min": 23
                  },
                  {
                    "avg": 31,
                    "day": "2023-06-15",
                    "max": 45,
                    "min": 20
                  },
                  {
                    "avg": 38,
                    "day": "2023-06-16",
                    "max": 38,
                    "min": 31
                  }
                ]
              }
            },
            "debug": {
              "sync": "2023-06-12T20:14:15+09:00"
            }
          }
        }
        ''');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await apiClient.getAirQualityStatus(city: city);
        expect(
          actual,
          isA<AirqualityStatus>().having((airq) => airq.status, "status", "ok"),
        );
      });
    });
  });
}
