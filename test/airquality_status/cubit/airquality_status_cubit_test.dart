import 'package:flutter_test/flutter_test.dart';
import 'package:airwatch_app/airquality_status/airquality_status.dart';
import 'package:mocktail/mocktail.dart';
import 'package:airquality_repository/airquality_repository.dart'
    as airquality_repository;

const status = 'ok';
const aqi = 34;

class MockAirQualityRepository extends Mock
    implements airquality_repository.AirQualityRepository {}

class MockAirQualityStatus extends Mock
    implements airquality_repository.AirqualityStatus {}

void main() {
  group('AirQualityStatus Cubit', () {
    late airquality_repository.AirqualityStatus airQualityStatus;
    late airquality_repository.AirQualityRepository airQualityStatusRepository;

    setUp(() async {
      airQualityStatus = MockAirQualityStatus();
      airQualityStatusRepository = MockAirQualityRepository();
      when(() => airQualityStatus.status).thenReturn(status);
      when(() => airQualityStatus.aqi).thenReturn(aqi);
      when(
        () => airQualityStatusRepository.getAirQualityStatus(
          any(),
          any(),
        ),
      ).thenAnswer((_) async => airQualityStatus);
    });
    test('initial state is correct', () {
      final airQualityStatusCubit =
          AirqualityStatusCubit(airQualityStatusRepository);
      expect(airQualityStatusCubit.state, AirqualityStatusState());
    });
  });
}
