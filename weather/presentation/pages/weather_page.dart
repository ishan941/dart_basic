import 'package:ai_agriculture_app/features/weather/domain/usecases/get_weather_forecast.dart';
import 'package:ai_agriculture_app/features/weather/presentation/widgets/current_weather_card.dart';
import 'package:ai_agriculture_app/features/weather/presentation/widgets/forecast_list.dart';
import 'package:ai_agriculture_app/features/weather/presentation/widgets/weather_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Replace with actual coordinates
    const lat = 40.7128;
    const lon = -74.0060;

    final weatherForecast = ref.watch(getWeatherForecastProvider((lat, lon)));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: weatherForecast.when(
            data: (forecast) => Column(
              children: [
                const WeatherAppBar(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      const SizedBox(height: 20),
                      CurrentWeatherCard(weather: forecast.current),
                      const SizedBox(height: 24),
                      ForecastList(forecasts: forecast.hourly),
                    ],
                  ),
                ),
              ],
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error Loading Weather',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
