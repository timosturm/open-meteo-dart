import 'package:open_meteo_dart/open_meteo_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final OpenMeteoApi api = OpenMeteoApi(logging: true);

    // setUp(() {
    //   // Additional setup goes here.
    // });

    // TODO More elaborate tests should be added.
    test('Test forecast api, all paramters', () {
      expectLater(
          api.forecastV1(
            latitude: 52.52,
            longitude: 13.41,
            hourlyParameters: HourlyParameter.allRequestParameters,
            dailyParameters: DailyParameter.allRequestParameters,
            currentWeather: true,
            forecastDays: 2,
            pastDays: 2,
          ),
          isA<ForecastResponseV1>());
    });
  });
}
