import 'package:ai_agriculture_app/features/weather/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastList extends StatelessWidget {
  final List<Weather> forecasts;

  const ForecastList({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Hourly Forecast',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecasts.length,
            itemBuilder: (context, index) {
              final forecast = forecasts[index];
              return _buildForecastItem(
                context,
                time: DateFormat('HH:mm').format(forecast.timestamp),
                temperature: '${forecast.temperature.toStringAsFixed(1)}°',
                icon: _getWeatherIcon(forecast.icon),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForecastItem(
    BuildContext context, {
    required String time,
    required String temperature,
    required IconData icon,
  }) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
          const SizedBox(height: 8),
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            temperature,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d':
        return Icons.wb_sunny;
      case '01n':
        return Icons.nightlight_round;
      case '02d':
      case '02n':
        return Icons.cloud;
      case '03d':
      case '03n':
      case '04d':
      case '04n':
        return Icons.cloud_queue;
      case '09d':
      case '09n':
        return Icons.grain;
      case '10d':
      case '10n':
        return Icons.beach_access;
      case '11d':
      case '11n':
        return Icons.flash_on;
      case '13d':
      case '13n':
        return Icons.ac_unit;
      case '50d':
      case '50n':
        return Icons.blur_on;
      default:
        return Icons.wb_sunny;
    }
  }
}
