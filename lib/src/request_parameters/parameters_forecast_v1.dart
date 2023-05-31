import 'package:json_annotation/json_annotation.dart';

/// ref: https://open-meteo.com/en/docs

/// Daily Parameter Definition
///
/// Aggregations are a simple 24 hour aggregation from hourly values.
@JsonEnum(valueField: "variable")
enum DailyParameter {
  /// Additional variable that is part of the server response but cannot be part of a request.
  ///
  /// - Unit: ISO8601
  time("time"),

  /// Minimum daily air temperature at 2 meters above ground.
  ///
  /// - Unit: [°C, °F]
  temperature2mMin("temperature_2m_min"),

  /// Maximum and minimum daily air temperature at 2 meters above ground.
  ///
  /// - Unit: [°C, °F]
  temperature2mMax("temperature_2m_max"),

  /// Minimum daily apparent temperature.
  ///
  /// - Unit: [°C, °F]
  apparentTemperatureMin("apparent_temperature_min"),

  /// Maximum daily apparent temperature.
  ///
  /// - Unit: [°C, °F]
  apparentTemperatureMax("apparent_temperature_max"),

  /// Sum of daily precipitation (including rain, showers and snowfall).
  ///
  /// - Unit: mm
  precipitationSum("precipitation_sum"),

  /// Sum of daily rain.
  ///
  /// - Unit: mm
  rainSum("rain_sum"),

  /// Sum of daily showers.
  ///
  /// - Unit: mm
  showersSum("showers_sum"),

  /// Sum of daily snowfall.
  ///
  /// - Unit: cm
  snowfallSum("snowfall_sum"),

  /// The number of hours with rain.
  ///
  /// - Unit: h
  precipitationHours("precipitation_hours"),

  /// Min probability of precipitaton.
  ///
  /// - Unit: %
  precipitationProbabilityMin("precipitation_probability_min"),

  /// Max probability of precipitaton.
  ///
  /// - Unit %
  precipitationProbabilityMax("precipitation_probability_max"),

  /// Mean probability of precipitaton.
  ///
  /// - Unit: %
  precipitationProbabilityMean("precipitation_probability_mean"),

  /// The most severe weather condition on a given day.
  ///
  /// - Units: [WMOWeatherInterpretationCode]
  weathercode("weathercode"),

  /// Sun rise time.
  ///
  ///	- Unit: iso8601
  sunrise("sunrise"),

  /// Sun set time.
  ///
  ///	- Unit: iso8601
  sunset("sunset"),

  /// Maximum wind speed  on a day.
  ///
  /// - Unit: [km/h, mph, m/s, knots]
  windspeed10mMax("windspeed_10m_max"),

  /// Maximum wind gusts  on a day.
  ///
  /// - Unit: [km/h, mph, m/s, knots]
  windgusts10mMax("windgusts_10m_max"),

  /// Dominant wind direction.
  ///
  /// - Unit: °
  winddirection10mDominant("winddirection_10m_dominant"),

  /// The sum of solar radiation on a given day in Megajoules.
  ///
  /// - Unit: MJ/m²
  shortwaveRadiationSum("shortwave_radiation_sum"),

  /// Daily sum of ET₀ Reference Evapotranspiration of a well watered grass field.
  ///
  /// - Unit: mm
  et0FaoEvapotranspiration("et0_fao_evapotranspiration"),

  /// Daily maximum UV Index starting from 0. Please follow the
  /// [official WMO guidelines](https://www.who.int/news-room/questions-and-answers/item/radiation-the-ultraviolet-(uv)-index)
  /// for ultraviolet index.
  ///
  /// - Unit: Index
  uvIndexMax("uv_index_max"),

  /// Daily maximum UV Index starting from 0 assuming cloud free conditions. Please follow the
  /// [official WMO guidelines](https://www.who.int/news-room/questions-and-answers/item/radiation-the-ultraviolet-(uv)-index)
  /// for ultraviolet index.
  ///
  /// - Unit: Index
  uvIndexClearSkyMax("uv_index_clear_sky_max");

  const DailyParameter(this.variable);

  final String variable;

  /// Returns all parameters that can be used in a request.
  static List<DailyParameter> get allRequestParameters =>
      DailyParameter.values.where((e) => e != DailyParameter.time).toList();
}

/// Hourly Parameter Definition:
///
/// Most weather variables are given as an instantaneous value for the indicated hour.
/// Some variables like precipitation are calculated from the preceding hour as an average or sum.
@JsonEnum(valueField: "variable")
enum HourlyParameter {
  /// Additional variable that is part of the server response but cannot be part of a request.
  ///
  /// - Unit: ISO8601
  time("time"),

  /// Air temperature at 2 meters above ground.
  ///
  /// - Valid time: Instant
  /// - Unit: [°C, °F]
  temperature2m("temperature_2m"),

  /// Relative humidity at 2 meters above ground.
  ///
  /// - Valid time: Instant
  /// - Unit: %
  relativehumidity2m("relativehumidity_2m"),

  /// Dew point temperature at 2 meters above ground.
  ///
  /// - Valid time: Instant
  /// - Unit: [°C, °F]
  dewpoint2m("dewpoint_2m"),

  /// Apparent temperature is the perceived feels-like temperature
  /// combining wind chill factor, relative humidity and solar radiation
  ///
  /// - Valid time: Instant
  /// - Unit: [°C, °F]
  apparentTemperature("apparent_temperature"),

  /// Atmospheric air pressure reduced to mean sea level (msl).
  /// Typically pressure on mean sea level is used in meteorology
  /// Surface pressure gets lower with increasing elevation.
  ///
  /// - Valid time: Instant
  /// - Unit: hPa
  pressureMsl("pressure_msl"),

  /// Atmospheric air pressure at surface.
  /// Typically pressure on mean sea level is used in meteorology.
  /// Surface pressure gets lower with increasing elevation.
  ///
  /// - Valid time: Instant
  /// - Unit: hPa
  surfacePressure("surface_pressure"),

  /// Total cloud cover as an area fraction.
  ///
  /// - Valid time: Instant
  /// - Unit: %
  cloudcover("cloudcover"),

  /// Low level clouds and fog up to 3 km altitude.
  ///
  /// - Valid time: Instant
  /// - Unit: %
  cloudcoverLow("cloudcover_low"),

  /// Mid level clouds from 3 to 8 km altitude.
  ///
  /// - Valid time: Instant
  /// - Unit: %
  cloudcoverMid("cloudcover_mid"),

  /// High level clouds from 8 km altitude.
  ///
  /// - Valid time: Instant
  /// - Unit: %
  cloudcoverHigh("cloudcover_high"),

  /// Wind speed at 10 meters above ground. Wind speed on 10 meters is the standard level.
  ///
  /// - Valid time: Instant
  /// - Unit: [km/h, mph, m/s, knots]
  windspeed10m("windspeed_10m"),

  /// Wind speed at 80 meters above ground. Wind speed on 10 meters is the standard level.
  ///
  /// - Valid time: Instant
  /// - Unit: [km/h, mph, m/s, knots]
  windspeed80m("windspeed_80m"),

  /// Wind speed at 120 meters above ground. Wind speed on 10 meters is the standard level.
  ///
  /// - Valid time: Instant
  /// - Unit: [km/h, mph, m/s, knots]
  windspeed120m("windspeed_120m"),

  /// Wind speed at 180 meters above ground. Wind speed on 10 meters is the standard level.
  ///
  /// - Valid time: Instant
  /// - Unit: [km/h, mph, m/s, knots]
  windspeed180m("windspeed_180m"),

  /// Wind direction at 10 meters above ground.
  ///
  /// - Valid time: Instant
  /// - Unit: °
  winddirection10m("winddirection_10m"),

  /// Wind direction at 80 meters above ground.
  ///
  /// - Valid time: Instant
  /// - Unit: °
  winddirection80m("winddirection_80m"),

  /// . Wind direction at 120 meters above ground.
  ///
  /// - Valid time: Instant
  /// - Unit: °
  winddirection120m("winddirection_120m"),

  /// Wind direction at 180 meters above ground.
  ///
  /// - Valid time: Instant
  /// - Unit: °
  winddirection180m("winddirection_180m"),

  /// Gusts at 10 meters above ground as a maximum of the preceding hour.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: [km/h, mph, m/s, knots]
  ///  	km/h (mph, m/s, knots)
  windgusts10m("windgusts_10m"),

  /// Shortwave solar radiation as average of the preceding hour.
  /// This is equal to the total global horizontal irradiation.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: W/m²
  shortwaveRadiation("shortwave_radiation"),

  /// Direct solar radiation as average of the preceding hour on the normal plane (perpendicular to the sun).
  ///
  /// - Valid time: Preceding hour
  /// - Unit: W/m²
  directRadiation("direct_radiation"),

  /// Direct solar radiation as average of the preceding hour on the horizontal plane.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: W/m²
  directNormalIrradiance("direct_normal_irradiance"),

  /// Diffuse solar radiation as average of the preceding hour.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: W/m²
  diffuseRadiation("diffuse_radiation"),

  /// Vapor Pressure Deficit (VPD) in kilopascal (kPa).
  /// For high VPD (>1.6), water transpiration of plants increases.
  /// For low VPD (<0.4), transpiration decreases.
  ///
  /// - Valid time: Instant
  /// - Unit: kPa
  vaporPressureDeficit("vapor_pressure_deficit"),

  /// Convective available potential energy. [See Wikipedia](https://en.wikipedia.org/wiki/Convective_available_potential_energy).
  ///
  /// - Valid time: Instant
  /// - Unit: J/kg
  cape("cape"),

  /// Sum of evapotranspration from land surface and plants that weather models assumes
  /// for this location. Available soil water is considered.
  /// 1 mm evapotranspiration per hour equals 1 liter of water per spare meter.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: [mm, inch]
  evapotranspiration("evapotranspiration"),

  /// Sum of ET₀ Reference Evapotranspiration of a well watered grass field. Based on FAO-56
  /// Penman-Monteith equations ET₀ is calculated from temperature, wind speed, humidity and solar radiation.
  /// Unlimited soil water is assumed. ET₀ is commonly used to estimate the required irrigation for plants.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: [mm, inch]
  et0FaoEvapotranspiration("et0_fao_evapotranspiration"),

  /// Total precipitation (rain, showers, snow) sum of the preceding hour.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: [mm, inch]
  precipitation("precipitation"),

  /// Sum of snowfall amount of the preceding hour in centimeters.
  /// For the water equivalent in millimeter, divide by 7.
  /// E.g. 7 cm snow = 10 mm precipitation water equivalent
  ///
  /// - Valid time: Preceding hour
  /// - Unit: [cm, inch]
  snowfall("snowfall"),

  /// Probability of precipitation with more than 0.1 mm of the preceding hour.
  /// Probability is based on ensemble weather models with 0.25° (~27 km) resolution.
  /// 30 different simulations are computed to better represent future weather conditions.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: %
  precipitationProbability("precipitation_probability"),

  /// Sum of rain from large scale weather systems of the preceding hour in millimeter.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: [mm, inch]
  rain("rain"),

  /// Sum of showers from convective precipitation in millimeters from the preceding hour.
  ///
  /// - Valid time: Preceding hour
  /// - Unit: [mm, inch]
  showers("showers"),

  /// Weather condition as a numeric code. Follow WMO weather interpretation codes.
  ///
  /// - Valid time: Instant
  /// - Unit: [WMOWeatherInterpretationCode]
  weathercode("weathercode"),

  ///	Snow depth on the ground.
  ///
  /// - Valid time: Instant
  /// - Unit: m
  snowDepth("snow_depth"),

  /// Altitude above sea level of the 0°C level.
  ///
  /// - Valid time: Instant
  /// - Unit: m
  freezinglevelHeight("freezinglevel_height"),

  /// Viewing distance in meters.
  /// Influenced by low clouds, humidity and aerosols.
  /// Maximum visibility is approximately 24 km.
  ///
  /// - Valid time: Instant
  /// - Unit: m
  visibility("visibility"),

  /// Temperature in the soil at 0 cm depth.
  /// 0 cm is the surface temperature on land or water surface temperature on water.
  ///
  /// - Valid time: Instant
  /// - Unit: [°C, °F]
  soilTemperature0cm("soil_temperature_0cm"),

  /// Temperature in the soil at 6 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: [°C, °F]
  soilTemperature6cm("soil_temperature_6cm"),

  /// Temperature in the soil at 18 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: [°C, °F]
  soilTemperature18cm("soil_temperature_18cm"),

  /// Temperature in the soil at 54 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: [°C, °F]
  soilTemperature54cm("soil_temperature_54cm"),

  /// Average soil water content as volumetric mixing ratio at 0-1 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: m³/m³
  soilMoisture0to1cm("soil_moisture_0_1cm"),

  /// Average soil water content as volumetric mixing ratio at 1-3 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: m³/m³
  soilMoisture1to3cm("soil_moisture_1_3cm"),

  /// Average soil water content as volumetric mixing ratio at 3-9 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: m³/m³
  soilMoisture3to9cm("soil_moisture_3_9cm"),

  /// Average soil water content as volumetric mixing ratio at 9-27 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: m³/m³
  soilMoisture9to27cm("soil_moisture_9_27cm"),

  /// Average soil water content as volumetric mixing ratio at 27-81 cm depth.
  ///
  /// - Valid time: Instant
  /// - Unit: m³/m³
  soilMoisture27to81cm("soil_moisture_27_81cm"),

  /// 1 if the current time step has daylight, 0 at night.
  ///
  /// - Valid time: Instant
  /// - Unit: Dimensionless
  isDay("is_day");

  const HourlyParameter(this.variable);

  final String variable;

  /// Returns all parameters that can be used in a request.
  static List<HourlyParameter> get allRequestParameters =>
      HourlyParameter.values.where((e) => e != HourlyParameter.time).toList();
}

/// WMO Weather interpretation codes (WW)
@JsonEnum(valueField: "code")
enum WMOWeatherInterpretationCode {
  /// Clear sky
  clearSky(code: 0),

  /// Mainly clear
  mainlyClear(code: 1),

  /// Partly cloudy
  partlyCloudy(code: 2),

  /// Overcast
  overcast(code: 3),

  /// Fog
  fog(code: 45),

  /// Depositing rime fog
  fogDespositingRime(code: 48),

  /// Light drizzle
  drizzleLight(code: 51),

  /// Moderate drizzle
  drizzleModerate(code: 53),

  /// Dense drizzle
  drizzleDense(code: 55),

  /// Slight freezing drizzle
  freezingDrizzleSlight(code: 56),

  /// Desnse freezing drizzle
  freezingDrizzleDense(code: 57),

  /// Slight rain fall
  rainSlight(code: 61),

  /// Moderate rain fall
  rainModerate(code: 63),

  /// Heavy rain fall
  rainHeavy(code: 65),

  /// Light freezing rain
  freezingRainLight(code: 66),

  /// Heavy freezing rain
  freezingRainHeavy(code: 67),

  /// Slight snow fall
  snowFallSlight(code: 71),

  /// Moderate snow fall
  snowFallModerate(code: 73),

  /// Heavy snow fall
  snowFallHeavy(code: 75),

  ///	Snow grains
  snowGrains(code: 77),

  /// Slight rain shower
  rainShowerSlight(code: 80),

  /// Moderate rain shower
  rainShowerModerate(code: 81),

  /// Violent rain shower
  rainShowerViolent(code: 82),

  /// Slight snow shower
  snowShoerSlight(code: 85),

  /// Heavy snow shower
  snowShowerHeavy(code: 86),

  /// Thunderstorm: slight or moderate
  thunderstormSlightOrModerate(code: 95),

  /// Thunderstrom with slight hail (only available in central europe)
  thunderstromSlightHail(code: 96),

  /// Thunderstorm with heavy hail (only available in central europe)
  thunderstormHeavyHail(code: 99);

  const WMOWeatherInterpretationCode({required this.code});

  final int code;
}

/// Current weather conditions.
@JsonEnum(valueField: "variable")
enum CurrentWeatherParameter {
  /// Additional variable that is part of the server response but cannot be part of a request.
  ///
  /// - Unit: ISO8601
  time("time"),

  /// Air temperature.
  ///
  /// - Unit: [°C, °F]
  temperature("temperature"),

  /// Wind speed.
  ///
  /// - Unit: [km/h, mph, m/s, knots]
  windspeed("windspeed"),

  /// Wind direction.
  ///
  /// - Unit: °
  winddirection("winddirection"),

  /// Weather condition as a numeric code. Follow WMO weather interpretation codes.
  ///
  /// - Unit: [WMOWeatherInterpretationCode]
  weathercode("weathercode"),

  /// 1 if the current time step has daylight, 0 at night.
  ///
  /// - Unit: Dimensionless
  isDay("is_day");

  const CurrentWeatherParameter(this.variable);

  final String variable;
}

/// Temperature units available from the api. To be used to specify a request parameter.
enum TemperatureUnit {
  celsius,
  fahrenheit,
}

/// Windspeed units available from the api. To be used to specify a request parameter.
enum WindspeedUnit {
  kmh,
  ms,
  mph,
  kn,
}

/// Precipitation units available from the api. To be used to specify a request parameter.
enum PrecipitationUnit {
  mm,
  inch,
}

/// Selections of cells available from the api. To be used to specify a request parameter.
enum CellSelection {
  /// Prefer grid-cells on land.
  land,

  /// Prefer grid-cells on sea.
  sea,

  /// Prefer nearest grid-cells, land or sea.
  nearest,
}

// TODO Pressure level variables
