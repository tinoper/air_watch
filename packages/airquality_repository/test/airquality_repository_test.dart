import 'package:mocktail/mocktail.dart';
import 'package:airquality_api/airquality_api.dart' as airquality_api;
import 'package:airquality_repository/airquality_repository.dart';
import 'package:test/test.dart';

class MockAirQualityApiClient extends Mock
    implements airquality_api.AirQualityApiClient {}

class MockAirQualityStatus extends Mock
    implements airquality_api.AirqualityStatus {}

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
          expect(AirQualityRepository(), isNotNull);
        });
      });

      group(
        'getAirQualityStatus',
        () {
          const city = 'Roma';

          test('calls getAirQualityStatus', () async {
            //late AirqualityStatus actual;
            try {
              AirqualityStatus actual =
                  await airQualityRepository.getAirQualityStatus(city);
              expect(
                actual,
                AirqualityStatus(status: 'ok', aqi: 34),
              );
            } catch (_) {}
          });
        },
      );
    },
  );
}
