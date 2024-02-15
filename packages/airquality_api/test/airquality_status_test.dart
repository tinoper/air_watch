import 'package:airquality_api/airquality_api.dart';
import 'package:airquality_api/src/models/airquality_status.dart';
import 'package:test/test.dart';

void main() {
  group('AirQualityStatus', () {
    group('fromJson', () {
      test('return AirQualityStatus object', () {
        expect(
          AirQualityStatus.fromJson(<String, dynamic>{
            "status": "ok",
            "data": {
              "aqi": 34,
              "idx": 9352,
              "attributions": [
                {
                  "url": "http://www.arpalazio.net/",
                  "name":
                      "ARAP Lazio - Agenzia Regionale per la Protezione dell'Ambiente del Lazio)",
                  "logo": "Italy-Arpa-Lazio.png"
                },
                {
                  "url": "https://waqi.info/",
                  "name": "World Air Quality Index Project"
                }
              ],
              "city": {
                "geo": [41.8932669, 12.4753855],
                "name": "Arenula, Roma, Lazio, Italy",
                "url": "https://aqicn.org/city/italy/lazio/roma/arenula",
                "location": ""
              },
              "dominentpol": "pm25",
              "iaqi": {
                "h": {"v": 48.3},
                "no2": {"v": 9.6},
                "o3": {"v": 15.5},
                "p": {"v": 1010.6},
                "pm10": {"v": 12},
                "pm25": {"v": 34},
                "t": {"v": 27.5}
              },
              "time": {
                "s": "2023-06-08 23:00:00",
                "tz": "+02:00",
                "v": 1686265200,
                "iso": "2023-06-08T23:00:00+02:00"
              },
              "forecast": {
                "daily": {
                  "o3": [
                    {"avg": 27, "day": "2023-06-09", "max": 41, "min": 15},
                    {"avg": 25, "day": "2023-06-10", "max": 40, "min": 12},
                    {"avg": 27, "day": "2023-06-11", "max": 42, "min": 14},
                    {"avg": 30, "day": "2023-06-12", "max": 53, "min": 16},
                    {"avg": 24, "day": "2023-06-13", "max": 24, "min": 22}
                  ],
                  "pm10": [
                    {"avg": 18, "day": "2023-06-09", "max": 23, "min": 12},
                    {"avg": 17, "day": "2023-06-10", "max": 21, "min": 14},
                    {"avg": 12, "day": "2023-06-11", "max": 16, "min": 7},
                    {"avg": 11, "day": "2023-06-12", "max": 15, "min": 8},
                    {"avg": 15, "day": "2023-06-13", "max": 17, "min": 15}
                  ],
                  "pm25": [
                    {"avg": 56, "day": "2023-06-09", "max": 72, "min": 38},
                    {"avg": 51, "day": "2023-06-10", "max": 64, "min": 38},
                    {"avg": 41, "day": "2023-06-11", "max": 53, "min": 24},
                    {"avg": 40, "day": "2023-06-12", "max": 52, "min": 30},
                    {"avg": 51, "day": "2023-06-13", "max": 59, "min": 51}
                  ]
                }
              },
              "debug": {"sync": "2023-06-09T18:53:52+09:00"}
            }
          }),
          isA<AirQualityStatus>()
              .having(
                (p0) => p0.status,
                'status',
                'ok',
              )
              .having(
                (p0) => p0.data.aqi,
                'aqi',
                34,
              ),
        );
      });
    });
  });
}
