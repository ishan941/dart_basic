import 'package:ai_agriculture_app/features/weather/domain/entities/weather.dart';
import 'package:ai_agriculture_app/features/weather/domain/entities/weather_forecast.dart';
import 'package:dio/dio.dart';

class WeatherApiClient {
  final Dio _dio;
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String _apiKey = 'a0f8be5db825f7ad1be3b665b56ec746';

  WeatherApiClient() : _dio = Dio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.queryParameters = {'appid': _apiKey};
    // Add logging interceptor
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<WeatherForecast> getWeatherForecast(double lat, double lon) async {
    try {
      print('Making API request with key: $_apiKey');

      // Get current weather
      final currentWeatherResponse = await _dio.get(
        '/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
        },
      );

      if (currentWeatherResponse.statusCode != 200) {
        print(
            'Current Weather API Error: ${currentWeatherResponse.statusCode} - ${currentWeatherResponse.statusMessage}');
        print('Response data: ${currentWeatherResponse.data}');
        throw Exception('Failed to load current weather');
      }

      // Get 5-day forecast
      final forecastResponse = await _dio.get(
        '/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
        },
      );

      if (forecastResponse.statusCode == 200) {
        final currentData = currentWeatherResponse.data;
        final forecastData = forecastResponse.data;

        // Create hourly forecast from the 3-hour forecast data
        final hourlyForecasts = (forecastData['list'] as List)
            .take(8) // Take first 8 entries (24 hours)
            .map((json) => Weather.fromJson(json as Map<String, dynamic>))
            .toList();

        return WeatherForecast(
          current: Weather.fromJson(currentData),
          hourly: hourlyForecasts,
        );
      } else {
        print(
            'Forecast API Error: ${forecastResponse.statusCode} - ${forecastResponse.statusMessage}');
        print('Response data: ${forecastResponse.data}');
        throw Exception('Failed to load weather forecast');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Error response: ${e.response?.data}');
      if (e.response?.statusCode == 401) {
        throw Exception(
            'Invalid API key. Please check your API key at https://home.openweathermap.org/api_keys');
      }
      throw Exception('Failed to load weather forecast: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to load weather forecast: $e');
    }
  }
}
