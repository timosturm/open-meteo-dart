// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponseV1 _$ForecastResponseV1FromJson(Map<String, dynamic> json) =>
    ForecastResponseV1(
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      (json['elevation'] as num).toDouble(),
      (json['generationtime_ms'] as num).toDouble(),
      json['utc_offset_seconds'] as int,
      json['timezone'] as String,
      json['timezone_abbreviation'] as String,
      (json['hourly'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            $enumDecode(_$HourlyParameterEnumMap, k), e as List<dynamic>),
      ),
      (json['hourly_units'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$HourlyParameterEnumMap, k), e as String),
      ),
      (json['daily'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            $enumDecode(_$DailyParameterEnumMap, k), e as List<dynamic>),
      ),
      (json['daily_units'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$DailyParameterEnumMap, k), e as String),
      ),
      (json['current_weather'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$CurrentWeatherParameterEnumMap, k), e),
      ),
    );

Map<String, dynamic> _$ForecastResponseV1ToJson(ForecastResponseV1 instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'generationtime_ms': instance.generationTimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbreviation,
      'hourly': instance.hourly
          ?.map((k, e) => MapEntry(_$HourlyParameterEnumMap[k]!, e)),
      'hourly_units': instance.hourlyUnits
          ?.map((k, e) => MapEntry(_$HourlyParameterEnumMap[k]!, e)),
      'daily': instance.daily
          ?.map((k, e) => MapEntry(_$DailyParameterEnumMap[k]!, e)),
      'daily_units': instance.dailyUnits
          ?.map((k, e) => MapEntry(_$DailyParameterEnumMap[k]!, e)),
      'current_weather': instance.currentWeather
          ?.map((k, e) => MapEntry(_$CurrentWeatherParameterEnumMap[k]!, e)),
    };

const _$HourlyParameterEnumMap = {
  HourlyParameter.time: 'time',
  HourlyParameter.temperature2m: 'temperature_2m',
  HourlyParameter.relativehumidity2m: 'relativehumidity_2m',
  HourlyParameter.dewpoint2m: 'dewpoint_2m',
  HourlyParameter.apparentTemperature: 'apparent_temperature',
  HourlyParameter.pressureMsl: 'pressure_msl',
  HourlyParameter.surfacePressure: 'surface_pressure',
  HourlyParameter.cloudcover: 'cloudcover',
  HourlyParameter.cloudcoverLow: 'cloudcover_low',
  HourlyParameter.cloudcoverMid: 'cloudcover_mid',
  HourlyParameter.cloudcoverHigh: 'cloudcover_high',
  HourlyParameter.windspeed10m: 'windspeed_10m',
  HourlyParameter.windspeed80m: 'windspeed_80m',
  HourlyParameter.windspeed120m: 'windspeed_120m',
  HourlyParameter.windspeed180m: 'windspeed_180m',
  HourlyParameter.winddirection10m: 'winddirection_10m',
  HourlyParameter.winddirection80m: 'winddirection_80m',
  HourlyParameter.winddirection120m: 'winddirection_120m',
  HourlyParameter.winddirection180m: 'winddirection_180m',
  HourlyParameter.windgusts10m: 'windgusts_10m',
  HourlyParameter.shortwaveRadiation: 'shortwave_radiation',
  HourlyParameter.directRadiation: 'direct_radiation',
  HourlyParameter.directNormalIrradiance: 'direct_normal_irradiance',
  HourlyParameter.diffuseRadiation: 'diffuse_radiation',
  HourlyParameter.vaporPressureDeficit: 'vapor_pressure_deficit',
  HourlyParameter.cape: 'cape',
  HourlyParameter.evapotranspiration: 'evapotranspiration',
  HourlyParameter.et0FaoEvapotranspiration: 'et0_fao_evapotranspiration',
  HourlyParameter.precipitation: 'precipitation',
  HourlyParameter.snowfall: 'snowfall',
  HourlyParameter.precipitationProbability: 'precipitation_probability',
  HourlyParameter.rain: 'rain',
  HourlyParameter.showers: 'showers',
  HourlyParameter.weathercode: 'weathercode',
  HourlyParameter.snowDepth: 'snow_depth',
  HourlyParameter.freezinglevelHeight: 'freezinglevel_height',
  HourlyParameter.visibility: 'visibility',
  HourlyParameter.soilTemperature0cm: 'soil_temperature_0cm',
  HourlyParameter.soilTemperature6cm: 'soil_temperature_6cm',
  HourlyParameter.soilTemperature18cm: 'soil_temperature_18cm',
  HourlyParameter.soilTemperature54cm: 'soil_temperature_54cm',
  HourlyParameter.soilMoisture0to1cm: 'soil_moisture_0_1cm',
  HourlyParameter.soilMoisture1to3cm: 'soil_moisture_1_3cm',
  HourlyParameter.soilMoisture3to9cm: 'soil_moisture_3_9cm',
  HourlyParameter.soilMoisture9to27cm: 'soil_moisture_9_27cm',
  HourlyParameter.soilMoisture27to81cm: 'soil_moisture_27_81cm',
  HourlyParameter.isDay: 'is_day',
};

const _$DailyParameterEnumMap = {
  DailyParameter.time: 'time',
  DailyParameter.temperature2mMin: 'temperature_2m_min',
  DailyParameter.temperature2mMax: 'temperature_2m_max',
  DailyParameter.apparentTemperatureMin: 'apparent_temperature_min',
  DailyParameter.apparentTemperatureMax: 'apparent_temperature_max',
  DailyParameter.precipitationSum: 'precipitation_sum',
  DailyParameter.rainSum: 'rain_sum',
  DailyParameter.showersSum: 'showers_sum',
  DailyParameter.snowfallSum: 'snowfall_sum',
  DailyParameter.precipitationHours: 'precipitation_hours',
  DailyParameter.precipitationProbabilityMin: 'precipitation_probability_min',
  DailyParameter.precipitationProbabilityMax: 'precipitation_probability_max',
  DailyParameter.precipitationProbabilityMean: 'precipitation_probability_mean',
  DailyParameter.weathercode: 'weathercode',
  DailyParameter.sunrise: 'sunrise',
  DailyParameter.sunset: 'sunset',
  DailyParameter.windspeed10mMax: 'windspeed_10m_max',
  DailyParameter.windgusts10mMax: 'windgusts_10m_max',
  DailyParameter.winddirection10mDominant: 'winddirection_10m_dominant',
  DailyParameter.shortwaveRadiationSum: 'shortwave_radiation_sum',
  DailyParameter.et0FaoEvapotranspiration: 'et0_fao_evapotranspiration',
  DailyParameter.uvIndexMax: 'uv_index_max',
  DailyParameter.uvIndexClearSkyMax: 'uv_index_clear_sky_max',
};

const _$CurrentWeatherParameterEnumMap = {
  CurrentWeatherParameter.time: 'time',
  CurrentWeatherParameter.temperature: 'temperature',
  CurrentWeatherParameter.windspeed: 'windspeed',
  CurrentWeatherParameter.winddirection: 'winddirection',
  CurrentWeatherParameter.weathercode: 'weathercode',
  CurrentWeatherParameter.isDay: 'is_day',
};
