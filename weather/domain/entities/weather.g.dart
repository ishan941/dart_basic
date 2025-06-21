// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      temperature: (json['temperature'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      description: json['description'] as String,
      icon: json['icon'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      visibility: (json['visibility'] as num?)?.toDouble() ?? 0,
      pressure: (json['pressure'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'temperature': instance.temperature,
      'feelsLike': instance.feelsLike,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'description': instance.description,
      'icon': instance.icon,
      'timestamp': instance.timestamp.toIso8601String(),
      'visibility': instance.visibility,
      'pressure': instance.pressure,
    };
