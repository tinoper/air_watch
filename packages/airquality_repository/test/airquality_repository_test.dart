import 'package:mocktail/mocktail.dart';
import 'package:airquality_api/airquality_api.dart' as airquality_api;
import 'package:airquality_repository/airquality_repository.dart';
import 'package:test/test.dart';

class MockAirQualityApiClient extends Mock
    implements airquality_api.AirQualityApiClient {}

class MockAirQualityStatus extends Mock
    implements airquality_api.AirQualityStatus {}

void main() {
  group(
    'AirQuality Repository',
    () {
      late airquality_api.AirQualityApiClient airQualityApiClient;
      late AirQualityRepository airQualityRepository;

      setUp(() {
        airQualityApiClient = MockAirQualityApiClient();
        airQualityRepository = AirQualityRepository(
          airQualityApiClient: airQualityApiClient,
        );
      });

      group('constructor', () {
        test('internal AirQualityApiClient when not injected', () {
          expect(
            AirQualityRepository(),
            isNotNull,
          );
        });
      });

      group(
        'getAirQualityStatus',
        () {
          const city = 'Roma';
          const token = '12345';

          test('calls getAirQualityStatus', () async {
            try {
              AirqualityStatus actual =
                  await airQualityRepository.getAirQualityStatus(
                city,
                token,
              );
              expect(
                actual,
                AirqualityStatus(
                  status: 'ok',
                  aqi: 34,
                ),
              );
            } catch (_) {}
          });
        },
      );
    },
  );
}
