import 'package:airquality_repository/airquality_repository.dart'
    as airquality_repository;

class AirQualityStatus {
  String status;
  int aqi;

  AirQualityStatus({
    required this.status,
    required this.aqi,
  });

  factory AirQualityStatus.fromJson(
    Map<String, dynamic> json,
  ) {
    final Data data = Data.fromJson(
      json["data"],
    );

    return AirQualityStatus(
      status: json["status"],
      aqi: data.aqi,
    );
  }

  static final empty = AirQualityStatus(
    status: "",
    aqi: 0,
  );

  factory AirQualityStatus.fromRepository(
    airquality_repository.AirqualityStatus airqualityStatus,
  ) {
    return AirQualityStatus(
      status: airqualityStatus.status,
      aqi: airqualityStatus.aqi,
    );
  }
}

class Data {
  int aqi;

  Data({
    required this.aqi,
  });

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) =>
      Data(
        aqi: json["aqi"],
      );
}
