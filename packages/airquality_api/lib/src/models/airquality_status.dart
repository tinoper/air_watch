class AirQualityStatus {
  String status;
  Data data;

  AirQualityStatus({
    required this.status,
    required this.data,
  });

  factory AirQualityStatus.fromJson(Map<String, dynamic> json) =>
      AirQualityStatus(
        status: json["status"],
        data: Data.fromJson(
          json["data"],
        ),
      );
}

class Data {
  int aqi;
  int idx;
  List<Attribution> attributions;
  City city;
  String dominentpol;
  Iaqi iaqi;
  Time time;
  Forecast forecast;
  Debug debug;

  Data({
    required this.aqi,
    required this.idx,
    required this.attributions,
    required this.city,
    required this.dominentpol,
    required this.iaqi,
    required this.time,
    required this.forecast,
    required this.debug,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aqi: json["aqi"],
        idx: json["idx"],
        attributions: List<Attribution>.from(
            json["attributions"].map((x) => Attribution.fromJson(x))),
        city: City.fromJson(json["city"]),
        dominentpol: json["dominentpol"],
        iaqi: Iaqi.fromJson(json["iaqi"]),
        time: Time.fromJson(json["time"]),
        forecast: Forecast.fromJson(json["forecast"]),
        debug: Debug.fromJson(json["debug"]),
      );
}

class Attribution {
  String url;
  String name;
  String? logo;

  Attribution({
    required this.url,
    required this.name,
    this.logo,
  });

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        url: json["url"],
        name: json["name"],
        logo: json["logo"],
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

class Debug {
  DateTime sync;

  Debug({
    required this.sync,
  });

  factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        sync: DateTime.parse(json["sync"]),
      );
}

class Forecast {
  Daily daily;

  Forecast({
    required this.daily,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        daily: Daily.fromJson(json["daily"]),
      );
}

class Daily {
  List<O3> o3;
  List<O3> pm10;
  List<O3> pm25;

  Daily({
    required this.o3,
    required this.pm10,
    required this.pm25,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        o3: List<O3>.from(json["o3"].map((x) => O3.fromJson(x))),
        pm10: List<O3>.from(json["pm10"].map((x) => O3.fromJson(x))),
        pm25: List<O3>.from(json["pm25"].map((x) => O3.fromJson(x))),
      );
}

class O3 {
  int avg;
  DateTime day;
  int max;
  int min;

  O3({
    required this.avg,
    required this.day,
    required this.max,
    required this.min,
  });

  factory O3.fromJson(Map<String, dynamic> json) => O3(
        avg: json["avg"],
        day: DateTime.parse(json["day"]),
        max: json["max"],
        min: json["min"],
      );
}

class Iaqi {
  H h;
  H no2;
  H o3;
  H p;
  H pm10;
  H pm25;
  H t;

  Iaqi({
    required this.h,
    required this.no2,
    required this.o3,
    required this.p,
    required this.pm10,
    required this.pm25,
    required this.t,
  });

  factory Iaqi.fromJson(Map<String, dynamic> json) => Iaqi(
        h: H.fromJson(json["h"]),
        no2: H.fromJson(json["no2"]),
        o3: H.fromJson(json["o3"]),
        p: H.fromJson(json["p"]),
        pm10: H.fromJson(json["pm10"]),
        pm25: H.fromJson(json["pm25"]),
        t: H.fromJson(json["t"]),
      );
}

class H {
  double v;

  H({
    required this.v,
  });

  factory H.fromJson(Map<String, dynamic> json) => H(
        v: json["v"]?.toDouble(),
      );
}

class Time {
  DateTime s;
  String tz;
  int v;
  DateTime iso;

  Time({
    required this.s,
    required this.tz,
    required this.v,
    required this.iso,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        s: DateTime.parse(json["s"]),
        tz: json["tz"],
        v: json["v"],
        iso: DateTime.parse(json["iso"]),
      );
}
