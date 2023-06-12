enum Status {
  ok,
  error,
}

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
}

class Data {
  int aqi;
  int idx;
  City city;

  Data({
    required this.aqi,
    required this.idx,
    required this.city,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aqi: json["aqi"],
        idx: json["idx"],
        city: City.fromJson(json["city"]),
      );
}

class City {
  List<double> geo;
  String name;
  String url;
  String location;

  City({
    required this.geo,
    required this.name,
    required this.url,
    required this.location,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        geo: List<double>.from(json["geo"].map((x) => x?.toDouble())),
        name: json["name"],
        url: json["url"],
        location: json["location"],
      );
}
