// To parse this JSON data, do
//
//     final airqualityStatus = airqualityStatusFromJson(jsonString);

import 'dart:convert';

// TODO: Add JsonSerializable
class AirqualityStatus {
  String status;
  Data data;

  AirqualityStatus({
    required this.status,
    required this.data,
  });

  factory AirqualityStatus.fromRawJson(String str) =>
      AirqualityStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AirqualityStatus.fromJson(Map<String, dynamic> json) =>
      AirqualityStatus(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
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

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "idx": idx,
        "attributions": List<dynamic>.from(attributions.map((x) => x.toJson())),
        "city": city.toJson(),
        "dominentpol": dominentpol,
        "iaqi": iaqi.toJson(),
        "time": time.toJson(),
        "forecast": forecast.toJson(),
        "debug": debug.toJson(),
      };
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

  factory Attribution.fromRawJson(String str) =>
      Attribution.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        url: json["url"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "logo": logo,
      };
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

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        geo: List<double>.from(json["geo"].map((x) => x?.toDouble())),
        name: json["name"],
        url: json["url"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "geo": List<dynamic>.from(geo.map((x) => x)),
        "name": name,
        "url": url,
        "location": location,
      };
}

class Debug {
  DateTime sync;

  Debug({
    required this.sync,
  });

  factory Debug.fromRawJson(String str) => Debug.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        sync: DateTime.parse(json["sync"]),
      );

  Map<String, dynamic> toJson() => {
        "sync": sync.toIso8601String(),
      };
}

class Forecast {
  Daily daily;

  Forecast({
    required this.daily,
  });

  factory Forecast.fromRawJson(String str) =>
      Forecast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        daily: Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "daily": daily.toJson(),
      };
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

  factory Daily.fromRawJson(String str) => Daily.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        o3: List<O3>.from(json["o3"].map((x) => O3.fromJson(x))),
        pm10: List<O3>.from(json["pm10"].map((x) => O3.fromJson(x))),
        pm25: List<O3>.from(json["pm25"].map((x) => O3.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "o3": List<dynamic>.from(o3.map((x) => x.toJson())),
        "pm10": List<dynamic>.from(pm10.map((x) => x.toJson())),
        "pm25": List<dynamic>.from(pm25.map((x) => x.toJson())),
      };
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

  factory O3.fromRawJson(String str) => O3.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory O3.fromJson(Map<String, dynamic> json) => O3(
        avg: json["avg"],
        day: DateTime.parse(json["day"]),
        max: json["max"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "avg": avg,
        "day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "max": max,
        "min": min,
      };
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

  factory Iaqi.fromRawJson(String str) => Iaqi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Iaqi.fromJson(Map<String, dynamic> json) => Iaqi(
        h: H.fromJson(json["h"]),
        no2: H.fromJson(json["no2"]),
        o3: H.fromJson(json["o3"]),
        p: H.fromJson(json["p"]),
        pm10: H.fromJson(json["pm10"]),
        pm25: H.fromJson(json["pm25"]),
        t: H.fromJson(json["t"]),
      );

  Map<String, dynamic> toJson() => {
        "h": h.toJson(),
        "no2": no2.toJson(),
        "o3": o3.toJson(),
        "p": p.toJson(),
        "pm10": pm10.toJson(),
        "pm25": pm25.toJson(),
        "t": t.toJson(),
      };
}

class H {
  double v;

  H({
    required this.v,
  });

  factory H.fromRawJson(String str) => H.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory H.fromJson(Map<String, dynamic> json) => H(
        v: json["v"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "v": v,
      };
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

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        s: DateTime.parse(json["s"]),
        tz: json["tz"],
        v: json["v"],
        iso: DateTime.parse(json["iso"]),
      );

  Map<String, dynamic> toJson() => {
        "s": s.toIso8601String(),
        "tz": tz,
        "v": v,
        "iso": iso.toIso8601String(),
      };
}
