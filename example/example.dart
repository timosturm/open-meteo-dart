import 'package:open_meteo_dart/open_meteo_dart.dart';

void main() async {
  // Create an instance of the api, customize the used [Dio] instance if you like:
  // ```dart
  // OpenMeteoApi api = OpenMeteoApi(customDio: Dio());
  // ```
  OpenMeteoApi api =
      OpenMeteoApi(log: true); // Print the response to the console.

  ForecastResponseV1 responseV1 = await api.forecastV1(
    latitude: 52.52,
    longitude: 13.41,
    // hourlyParameters: HourlyParameter.allRequestParameters,  // Request all parameters.
    hourlyParameters: [
      HourlyParameter.temperature2m,
      HourlyParameter.cloudcoverLow,
    ],
    // dailyParameters: DailyParameter.allRequestParameters, // Request all parameters.
    dailyParameters: [
      DailyParameter.apparentTemperatureMax,
      DailyParameter.precipitationSum,
    ],
    currentWeather: true,
    forecastDays: 2,
    pastDays: 2,
  );

  print(
      "Current temperature: ${responseV1.currentWeather?[CurrentWeatherParameter.temperature]}");
  // Current temperature: 24.3

  print("Requested days: ${responseV1.daily?[DailyParameter.time]}");
  // Requested days: [2023-05-29, 2023-05-30, 2023-05-31, 2023-06-01]
  print(
      "Daily apparent max temperature: ${responseV1.daily?[DailyParameter.apparentTemperatureMax]}");
  // Daily apparent max temperature: [19.8, 20.5, 22.6, 20.4]
}
