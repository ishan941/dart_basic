import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double windSpeed;
  final String description;
  final String icon;
  final DateTime timestamp;
  final double visibility;
  final double pressure;

  Weather({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    required this.icon,
    required this.timestamp,
    this.visibility = 0,
    this.pressure = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    // Handle both current weather and forecast responses
    final main = json['main'] as Map<String, dynamic>? ?? json;
    final weather =
        (json['weather'] as List?)?.first as Map<String, dynamic>? ??
            {'description': 'Unknown', 'icon': '01d'};
    final wind = json['wind'] as Map<String, dynamic>? ?? {'speed': 0.0};

    return Weather(
      temperature: (main['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (main['feels_like'] as num?)?.toDouble() ?? 0.0,
      humidity: (main['humidity'] as num?)?.toDouble() ?? 0.0,
      windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0.0,
      description: weather['description'] as String? ?? 'Unknown',
      icon: weather['icon'] as String? ?? '01d',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (json['dt'] as int?)?.toInt() ?? DateTime.now().millisecondsSinceEpoch,
      ),
      visibility: (json['visibility'] as num?)?.toDouble() ?? 0.0,
      pressure: (main['pressure'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
