import 'package:json_annotation/json_annotation.dart';

import 'package:open_meteo_dart/src/request_parameters/parameters_forecast_v1.dart';

part 'response_forecast.g.dart';

/// Object representation of the JSON response from the /v1/forecast endpoint.
@JsonSerializable()
class ForecastResponseV1 {
  /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be a few kilometers away from the requested coordinate.
  final double latitude;

  /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be a few kilometers away from the requested coordinate.
  final double longitude;

  /// The elevation from a 90 meter digital elevation model. This effects which grid-cell is selected (see parameter cell_selection). Statistical downscaling is used to adapt weather conditions for this elevation. This elevation can also be controlled with the query parameter elevation. If &elevation=nan is specified, all downscaling is disabled and the averge grid-cell elevation is used.
  final double elevation;

  /// Generation time of the weather forecast in milliseconds. This is mainly used for performance monitoring and improvements.
  @JsonKey(name: "generationtime_ms")
  final double generationTimeMs;

  /// Applied timezone offset from the &timezone= parameter.
  @JsonKey(name: "utc_offset_seconds")
  final int utcOffsetSeconds;

  /// Timezone identifier (e.g. Europe/Berlin)
  final String timezone;

  /// Timezone abbreviation (e.g. CEST)
  @JsonKey(name: "timezone_abbreviation")
  final String timezoneAbbreviation;

  /// Object 	For each selected weather variable, data will be returned as a floating point array. Additionally a time array will be returned with ISO8601 timestamps.
  final Map<HourlyParameter, List>? hourly;

  ///	For each selected weather variable, the unit will be listed here.
  @JsonKey(name: "hourly_units")
  final Map<HourlyParameter, String>? hourlyUnits;

  ///	Object 	For each selected daily weather variable, data will be returned as a floating point array. Additionally a time array will be returned with ISO8601 timestamps.
  final Map<DailyParameter, List>? daily;

  ///	For each selected daily weather variable, the unit will be listed here.
  @JsonKey(name: "daily_units")
  final Map<DailyParameter, String>? dailyUnits;

  ///	Object 	Current weather conditions with the attributes: time, temperature, windspeed, winddirection and weathercode
  @JsonKey(name: "current_weather")
  final Map<CurrentWeatherParameter, dynamic>? currentWeather;

  const ForecastResponseV1(
    this.latitude,
    this.longitude,
    this.elevation,
    this.generationTimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.hourly,
    this.hourlyUnits,
    this.daily,
    this.dailyUnits,
    this.currentWeather,
  );

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ForecastResponseV1.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseV1FromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastResponseV1ToJson(this);

  @override
  String toString() {
    return 'ForecastResponse(latitude: $latitude, longitude: $longitude, elevation: $elevation, generationTimeMs: $generationTimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbreviation: $timezoneAbbreviation, hourly: $hourly, hourlyUnits: $hourlyUnits, daily: $daily, dailyUnits: $dailyUnits, currentWeather: $currentWeather)';
  }
}
