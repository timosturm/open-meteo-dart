import 'package:open_meteo_dart/src/request_parameters/parameters_forecast_v1.dart';

/// TODO
class ForecastResponse {
  /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be a few kilometers away from the requested coordinate.
  final double latitude;

  /// WGS84 of the center of the weather grid-cell which was used to generate this forecast. This coordinate might be a few kilometers away from the requested coordinate.
  final double longitude;

  /// The elevation from a 90 meter digital elevation model. This effects which grid-cell is selected (see parameter cell_selection). Statistical downscaling is used to adapt weather conditions for this elevation. This elevation can also be controlled with the query parameter elevation. If &elevation=nan is specified, all downscaling is disabled and the averge grid-cell elevation is used.
  final double elevation;

  /// Generation time of the weather forecast in milliseconds. This is mainly used for performance monitoring and improvements.
  final double generationtime_ms;

  /// Applied timezone offset from the &timezone= parameter.
  final int utc_offset_seconds;

  /// Timezone identifier (e.g. Europe/Berlin)
  final String timezone;

  /// Timezone abbreviation (e.g. CEST)
  final String timezone_abbreviation;

  /// Object 	For each selected weather variable, data will be returned as a floating point array. Additionally a time array will be returned with ISO8601 timestamps.
  final Map<HourlyParameter, List> hourly;

  ///	Object 	For each selected weather variable, the unit will be listed here.
  final Map<HourlyParameter, String> hourly_units;

  ///	Object 	For each selected daily weather variable, data will be returned as a floating point array. Additionally a time array will be returned with ISO8601 timestamps.
  final Map<DailyParameter, List> daily;

  ///	Object 	For each selected daily weather variable, the unit will be listed here.
  final Map<DailyParameter, String> daily_units;

  ///	Object 	Current weather conditions with the attributes: time, temperature, windspeed, winddirection and weathercode
  final Map current_weather;

  // TODO How to handle the "time" value for hourly and daily?
  ForecastResponse(
    this.latitude,
    this.longitude,
    this.elevation,
    this.generationtime_ms,
    this.utc_offset_seconds,
    this.timezone,
    this.timezone_abbreviation,
    this.hourly,
    this.hourly_units,
    this.daily,
    this.daily_units,
    this.current_weather,
  );
}
