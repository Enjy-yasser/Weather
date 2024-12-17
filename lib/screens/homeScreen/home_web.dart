import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors_app.dart';
import '../../generated/l10n.dart';
import '../../model/weather_model.dart';

class HomeWeb extends StatelessWidget {
  final List<WeatherModel> weatherData;

  const HomeWeb({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.nightBlue : AppColors.whiteColor,

      body: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth > 1400 ? 6 : 4;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: constraints.maxWidth > 1400 ? 4 / 3 : 3 / 2,
              ),
              itemCount: weatherData.length,
              itemBuilder: (context, index) {
                WeatherModel weather = weatherData[index];

                return Card(
                  color: isDarkMode ? AppColors.nightBlue : AppColors.cloudWhite,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${weather.locationName}, ${weather.region}",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Image.network(
                            "https:${weather.conditionIcon}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          weather.conditionText,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Temperature: ${weather.temperatureC}°C",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Local Time: ${weather.localTime}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
