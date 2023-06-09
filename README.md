<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# open-meteo-dart
A client for [open-meteo](https://open-meteo.com/) API written in dart.
It currently only supports the `forecast` endpoint, but other endpoints are planned in the future.


## Features

- `forecast` API with automatic model selection performed by the server

### Planned features
- other endpoints, see [here](https://open-meteo.com/en/docs):
    - historical weather
    - ensembel models
    - climate change
    - marine forecast
    - air quality
    - geocoding
    - elevation
    - flood
- requesting a specific model atthe `forecast` endpoint

## Getting started

<!-- TODO Add this when the package is available at pub.dev
You can use the command line to add the dependency with the latest stable version:
```shell
$ dart pub add open-meteo-dart
```
-->

<!--
You can manually add the dependency in your `pubspec.yaml`:
```yaml
dependencies:
    open-meteo-dart:
        git: https://github.com/timosturm/open-meteo-dart.git
        ref: stable # TODO inlcude a tag here!
```
-->

You can also use a version from github in `pubspec.yaml`:
```yaml
dependencies:
      open_meteo_dart:
        git: 
          url: https://github.com/timosturm/open-meteo-dart.git
          ref: v0.0.1 # Get version 0.0.1 of the API.
```


## Usage

<!-- TODO Automatically include the example from example/short_example.dart -->
```dart
import 'package:open_meteo_dart/open_meteo_dart.dart';

void main() async {
  OpenMeteoApi api =
      OpenMeteoApi(logging: true); // Print the response to the console.

  ForecastResponseV1 responseV1 = await api.forecastV1(
    latitude: 52.52,
    longitude: 13.41,
    hourlyParameters:
        HourlyParameter.allRequestParameters, 
    dailyParameters: DailyParameter.allRequestParameters,
    currentWeather: true,
    forecastDays: 2,
    pastDays: 2,
  );

  print("Current temperature: ${responseV1.currentWeather?[CurrentWeatherParameter.temperature]}");
  // Current temperature: 24.3

  print("Requested days: ${responseV1.daily?[DailyParameter.time]}");
  // Requested days: [2023-05-29, 2023-05-30, 2023-05-31, 2023-06-01]
  print("Daily apparent max temperature: ${responseV1.daily?[DailyParameter.apparentTemperatureMax]}");
  // Daily apparent max temperature: [19.8, 20.5, 22.6, 20.4]
}
```

A more ellaborate example can be found [here](example/example.dart).

## Additional information

More information about open-meteo can be found at the [official site](https://open-meteo.com/), including information about the weather variables.

For now, I consider this package usable. If you require a certain API that is not yet implemented, please fell free to file an issue or (even better) submit a pull request.

For code / implementation style take a look at the implemented forecast API. I prefer to have all request and response parameters hard coded as an `enum` to allow easier use via code-completion and type-safety. E.g., a user will know what parameters are allowed by the forecast API for daily forecasts by looking at the enum `DailyParameter`.
