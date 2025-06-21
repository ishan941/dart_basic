import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ai_agriculture_app/providers/weather_provider.dart';

class WeatherApiClient {
  final Dio _dio;
  late final String _apiKey;

  WeatherApiClient() : _dio = Dio() {
    _apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';
    if (_apiKey.isEmpty) {
      throw Exception(
          'Weather API key not found. Please add WEATHER_API_KEY to your .env file');
    }

    _dio.options.baseUrl = 'https://api.openweathermap.org/data/2.5';
    _dio.options.queryParameters = {
      'appid': _apiKey,
      'units': 'metric',
    };
  }

  Future<Map<String, dynamic>> getWeatherForecast(
      double lat, double lon) async {
    try {
      final response = await _dio.get(
        '/onecall',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'exclude': 'minutely,daily,alerts',
        },
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception(
            'Invalid API key. Please check your WEATHER_API_KEY in .env file');
      }
      throw Exception('Failed to fetch weather forecast: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch weather forecast: $e');
    }
  }

  Future<Map<String, dynamic>> getCurrentWeather(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
        },
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception(
            'Invalid API key. Please check your WEATHER_API_KEY in .env file');
      }
      throw Exception('Failed to fetch current weather: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch current weather: $e');
    }
  }
}
