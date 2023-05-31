import 'package:dio/dio.dart';
import 'package:open_meteo_dart/src/request_parameters/parameters_forecast_v1.dart';

import 'models/response_forecast.dart';

class OpenMeteoApi {
  final String baseURL = "https://api.open-meteo.com";
  final String endpointForecastV1 = "/v1/forecast";

  final Dio dio = Dio();

  OpenMeteoApi() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  /// Calls the forecast v1 endpoint.
  ///
  /// TODO Add fine grained support for specific models.
  ///
  /// Params:
  /// - latitude: Geographical WGS84 coordinate of the location.
  /// - longitude: Geographical WGS84 coordinate of the location.
  /// - elevation: The elevation used for statistical downscaling.
  ///              Per default, a [90 meter digital elevation model](https://openmeteo.substack.com/p/improving-weather-forecasts-with) is used.
  ///              You can manually set the elevation to correctly match mountain peaks.
  ///              If elevation is not specified, downscaling will be disabled and the
  ///              API uses the average grid-cell height.
  /// - hourly: A list of weather variables which should be returned.
  /// - daily: A list of daily weather variable aggregations which should be returned.
  /// - currentWeather: Weather to include current weather conditions.
  /// - temperatureUnit: [TemperatureUnit] to use.
  /// - windspeedUnit: [WindspeedUnit] to use.
  /// - precipitationUnit:[PrecipitationUnit] to use.
  /// - pastDays: Include data aboute past days in response, valid values between 0 and 92 days.
  /// - forecastDays: Include data about this many days into the future, for [forecastDays] set to 1 returns the current day.
  /// - startDate: The [DateTime] interval to get weather data.
  /// - endDate: The [DateTime] interval to get weather data.
  /// - TODO models auto	String array 	No 	auto 	Manually select one or more weather models. Per default, the best suitable weather models will be combined.
  /// - cellSelection: Set a preference how grid-cells are selected. The default [CellSelection.land] finds a suitable grid-cell on land with
  ///                  [similar elevation to the requested coordinates using a 90-meter digital elevation model](https://openmeteo.substack.com/p/improving-weather-forecasts-with).
  ///                  [CellSelection.sea] prefers grid-cells on sea. [CellSelection.nearest] selects the nearest possible grid-cell.
  Future<ForecastResponseV1> forecastV1({
    required double latitude,
    required double longitude,
    double? elevation, // TODO Use 90 or null as the default?
    List<DailyParameter>? dailyParameters,
    List<HourlyParameter>? hourlyParameters,
    bool currentWeather = false,
    TemperatureUnit temperatureUnit = TemperatureUnit.celsius,
    WindspeedUnit windspeedUnit = WindspeedUnit.kmh,
    PrecipitationUnit precipitationUnit = PrecipitationUnit.mm,
    int? pastDays,
    int? forecastDays,
    DateTime? startDate, // TODO Use datetime
    DateTime? endDate, // TODO Use datetime
    // String models = "auto", // TODO Make an enum
    CellSelection cellSelection = CellSelection.land,
  }) async {
    if (forecastDays != null) {
      assert(0 <= forecastDays && forecastDays <= 16);
    }

    if (pastDays != null) {
      assert(0 <= pastDays && pastDays <= 92);
    }

    // Either start_date and end_date must be given or one of forecast_days or past_days.
    assert((startDate != null && endDate != null) ||
        (forecastDays != null || pastDays != null));

    // TODO past_days and forecast_days are mutually exclusive with start_date and end_date.

    if (startDate != null || endDate != null) {
      // Both must be given at the same time.
      assert(startDate != null && endDate != null);
      assert(pastDays == null && forecastDays == null);
    }

    final Map<String, dynamic> queryParameters = {
      "latitude": latitude,
      "longitude": longitude,
      "elevation": elevation ?? "nan",
      "daily":
          dailyParameters?.expand((element) => [element.variable]).join(","),
      "hourly": hourlyParameters?.expand((e) => [e.variable]).join(","),
      "current_weather": currentWeather,
      "temperature_unit": temperatureUnit.name,
      "windspeed_unit": windspeedUnit.name,
      "precipitation_unit": precipitationUnit.name,
      "timeformat":
          "iso8601", // Hardcoded value because we work with [DateTime] anyways.
      "timezone":
          "UTC", // FIXME The timezone stuff must be fixed, this will make the api return UTC timezone which must be converted back to local!
      "past_days": pastDays,
      "forecast_days": forecastDays,
      "start_date": startDate
          ?.toUtc()
          .toIso8601String()
          .substring(0, 10), // Only retain the yyyy-mm-dd part.
      "end_date": endDate
          ?.toUtc()
          .toIso8601String()
          .substring(0, 10), // Only retain the yyyy-mm-dd part.
      // "models": models,
      "cell_selection": cellSelection.name,
    };

    final response = await dio.get(
      "$baseURL$endpointForecastV1",
      queryParameters: queryParameters,
    );

    // TODO Return custom reponse instance.
    // return response;
    return ForecastResponseV1.fromJson(response.data);
  }
}

void main() {
  OpenMeteoApi api = OpenMeteoApi();

   api.forecastV1(
    latitude: 51.32,
    longitude: 9.50,
    // hourlyParameters: HourlyParameter.allRequestParameters,
    // dailyParameters: DailyParameter.allRequestParameters,
    currentWeather: true,
    // forecast_days: 2,
    // past_days: 2,
    startDate: DateTime(2023, 5, 28),
    endDate: DateTime(2023, 5, 31),
  ).then((response) => print(response));
}
