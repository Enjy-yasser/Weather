import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors_app.dart';
// import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/model/weather_model.dart';

class HomeMobile extends StatelessWidget {
  final List<WeatherModel> weatherData;

  const HomeMobile({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.stormyGrey : AppColors.skyBlue,
      // appBar: AppBar(
      //   backgroundColor: isDarkMode ? AppColors.nightBlue : AppColors.cloudWhite,
      //   title: Text(
      //     S.of(context).weatherForecast,
      //     style: Theme.of(context).appBarTheme.titleTextStyle,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            WeatherModel weather = weatherData[index];

            return Card(
              color: isDarkMode ? AppColors.nightBlue : AppColors.cloudWhite,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${weather.locationName}, ${weather.region}, ${weather.country}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Image.network(
                        "https:${weather.conditionIcon}",
                        width: 64,
                        height: 64,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      weather.conditionText,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Temperature: ${weather.temperatureC}°C",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Local Time: ${weather.localTime}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
