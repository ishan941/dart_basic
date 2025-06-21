import 'package:ai_agriculture_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:ai_agriculture_app/features/weather/domain/entities/weather_forecast.dart';
import 'package:ai_agriculture_app/providers/weather_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getWeatherForecastProvider =
    FutureProvider.family<WeatherForecast, (double, double)>(
        (ref, params) async {
  final repository = ref.watch(weatherRepositoryProvider);
  final (lat, lon) = params;
  return repository.getWeatherForecast(lat, lon);
});
