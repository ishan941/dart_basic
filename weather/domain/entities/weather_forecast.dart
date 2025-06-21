import 'package:json_annotation/json_annotation.dart';
import 'weather.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final Weather current;
  final List<Weather> hourly;

  WeatherForecast({
    required this.current,
    required this.hourly,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      current: Weather.fromJson(json),
      hourly: (json['list'] as List)
          .map((item) => Weather.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}
