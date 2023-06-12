import 'package:airquality_repository/airquality_repository.dart'
    hide AirqualityStatus;
import 'package:airquality_repository/airquality_repository.dart'
    as airquality_repository;

class AirqualityStatus {
  String status;
  int aqi;

  AirqualityStatus({
    required this.status,
    required this.aqi,
  });

  factory AirqualityStatus.fromJson(Map<String, dynamic> json) {
    final Data data = Data.fromJson(json["data"]);

    return AirqualityStatus(
      status: json["status"],
      aqi: data.aqi,
    );
  }

  static final empty = AirqualityStatus(
    status: "",
    aqi: 0,
  );

  factory AirqualityStatus.fromRepository(
      airquality_repository.AirqualityStatus airqualityStatus) {
    return AirqualityStatus(
        status: airqualityStatus.status, aqi: airqualityStatus.aqi);
  }

  @override
  List<Object> get props => [status, aqi];
}

class Data {
  int aqi;

  Data({
    required this.aqi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aqi: json["aqi"],
      );
}
