import 'package:ai_agriculture_app/features/weather/domain/entities/weather_forecast.dart';

abstract class WeatherRepository {
  Future<WeatherForecast> getWeatherForecast(double lat, double lon);
}
