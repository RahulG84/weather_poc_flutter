// class WeatherData {
//   Coord? coord;
//   List<Weather>? weather;
//   String? base;
//   Main? main;
//   int? visibility;
//   Wind? wind;
//   Clouds? clouds;
//   int? dt;
//   Sys? sys;
//   int? timezone;
//   int? id;
//   String? name;
//   int? cod;
//
//   WeatherData(
//       {this.coord,
//       this.weather,
//       this.base,
//       this.main,
//       this.visibility,
//       this.wind,
//       this.clouds,
//       this.dt,
//       this.sys,
//       this.timezone,
//       this.id,
//       this.name,
//       this.cod});
//
//   WeatherData.fromJson(Map<String, dynamic> json) {
//     coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather!.add(Weather.fromJson(v));
//       });
//     }
//     base = json['base'];
//     main = json['main'] != null ? Main.fromJson(json['main']) : null;
//     visibility = json['visibility'];
//     wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
//     clouds =
//         json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
//     dt = json['dt'];
//     sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
//     timezone = json['timezone'];
//     id = json['id'];
//     name = json['name'];
//     cod = json['cod'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (coord != null) {
//       data['coord'] = coord!.toJson();
//     }
//     if (weather != null) {
//       data['weather'] = weather!.map((v) => v.toJson()).toList();
//     }
//     data['base'] = base;
//     if (main != null) {
//       data['main'] = main!.toJson();
//     }
//     data['visibility'] = visibility;
//     if (wind != null) {
//       data['wind'] = wind!.toJson();
//     }
//     if (clouds != null) {
//       data['clouds'] = clouds!.toJson();
//     }
//     data['dt'] = dt;
//     if (sys != null) {
//       data['sys'] = sys!.toJson();
//     }
//     data['timezone'] = timezone;
//     data['id'] = id;
//     data['name'] = name;
//     data['cod'] = cod;
//     return data;
//   }
// }
//
// class Coord {
//   double? lon;
//   double? lat;
//
//   Coord({this.lon, this.lat});
//
//   Coord.fromJson(Map<String, dynamic> json) {
//     lon = json['lon'];
//     lat = json['lat'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lon'] = lon;
//     data['lat'] = lat;
//     return data;
//   }
// }
//
// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;
//
//   Weather({this.id, this.main, this.description, this.icon});
//
//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['main'] = main;
//     data['description'] = description;
//     data['icon'] = icon;
//     return data;
//   }
// }
//
// class Main {
//   num? temp;
//   double? feelsLike;
//   num? tempMin;
//   num? tempMax;
//   int? pressure;
//   int? humidity;
//   int? seaLevel;
//   int? grndLevel;
//
//   Main({
//     this.temp,
//     this.feelsLike,
//     this.tempMin,
//     this.tempMax,
//     this.pressure,
//     this.humidity,
//     this.seaLevel,
//     this.grndLevel,
//   });
//
//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     tempMin = json['temp_min'];
//     tempMax = json['temp_max'];
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     seaLevel = json['sea_level'];
//     grndLevel = json['grnd_level'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['temp'] = temp;
//     data['feels_like'] = feelsLike;
//     data['temp_min'] = tempMin;
//     data['temp_max'] = tempMax;
//     data['pressure'] = pressure;
//     data['humidity'] = humidity;
//     data['sea_level'] = seaLevel;
//     data['grnd_level'] = grndLevel;
//     return data;
//   }
// }
//
// class Wind {
//   double? speed;
//   int? deg;
//   double? gust;
//
//   Wind({this.speed, this.deg, this.gust});
//
//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//     deg = json['deg'];
//     gust = json['gust'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['speed'] = speed;
//     data['deg'] = deg;
//     data['gust'] = gust;
//     return data;
//   }
// }
//
// class Clouds {
//   int? all;
//
//   Clouds({this.all});
//
//   Clouds.fromJson(Map<String, dynamic> json) {
//     all = json['all'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['all'] = all;
//     return data;
//   }
// }
//
// class Sys {
//   String? country;
//   int? sunrise;
//   int? sunset;
//
//   Sys({this.country, this.sunrise, this.sunset});
//
//   Sys.fromJson(Map<String, dynamic> json) {
//     country = json['country'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['country'] = country;
//     data['sunrise'] = sunrise;
//     data['sunset'] = sunset;
//     return data;
//   }
// }

import 'package:json_annotation/json_annotation.dart';
part 'weather_data_model.g.dart';

@JsonSerializable()
class WeatherData {
  @JsonKey(name: "coord")
  Coord coord;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "base")
  String base;
  @JsonKey(name: "main")
  Main main;
  @JsonKey(name: "visibility")
  int visibility;
  @JsonKey(name: "wind")
  Wind wind;
  @JsonKey(name: "clouds")
  Clouds clouds;
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "sys")
  Sys sys;
  @JsonKey(name: "timezone")
  int timezone;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "cod")
  int cod;

  WeatherData({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class Clouds {
  @JsonKey(name: "all")
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Coord {
  @JsonKey(name: "lon")
  double lon;
  @JsonKey(name: "lat")
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Main {
  @JsonKey(name: "temp")
  double temp;
  @JsonKey(name: "feels_like")
  double feelsLike;
  @JsonKey(name: "temp_min")
  double tempMin;
  @JsonKey(name: "temp_max")
  double tempMax;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "sea_level")
  int seaLevel;
  @JsonKey(name: "grnd_level")
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Sys {
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "sunrise")
  int sunrise;
  @JsonKey(name: "sunset")
  int sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class Weather {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "main")
  String main;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "icon")
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Wind {
  @JsonKey(name: "speed")
  double speed;
  @JsonKey(name: "deg")
  int deg;
  @JsonKey(name: "gust")
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
