import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/permission_req.dart';
import 'package:weather_app/responsive/responsive_text.dart';

import 'constant/api_app.dart';
import 'constant/colors_app.dart';
import 'constant/routes_app.dart';
import 'constant/style_app.dart';
import 'download.dart';
import 'generated/l10n.dart';
import 'model/weather_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final AppApi _appApi = AppApi(); // Correct reference to the API handler class
  final WeatherDownloader _weatherDownloader = WeatherDownloader();

  String? _weatherInfo;
  String? _currentLocation;

  Future<void> _getCurrentLocationWeather() async {
    try {
      final hasPermissions = await PermissionReq().requestPermissions();
      if (!hasPermissions) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permissions not granted'), backgroundColor: Colors.red),
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );
      _currentLocation = "${position.latitude},${position.longitude}";

      final weatherData = await _appApi.weatherApiCall(_currentLocation!);
      final weatherModel = WeatherModel.fromJson(weatherData);

      // Formatting the weather information
      setState(() {
        _weatherInfo = """
      Location: ${weatherModel.locationName}, ${weatherModel.country}
      Region: ${weatherModel.region}
      Temperature: ${weatherModel.temperatureC}°C
      Condition: ${weatherModel.conditionText}
      Local Time: ${weatherModel.localTime}
            """;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching weather: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _downloadWeatherInfo() async {
    if (_weatherInfo != null) {
      try {
        final directory = Directory('/storage/emulated/0/Download'); // Public Downloads folder
        if (!directory.existsSync()) {
          directory.createSync(recursive: true);
        }
        final filePath = '${directory.path}/weather_info.txt';
        final file = File(filePath);
        await file.writeAsString(_weatherInfo!);

        // Print file path to console
        print('Weather info saved at: $filePath');

        // Show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Weather details saved to $filePath'), backgroundColor: Colors.green),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save weather details: $e'), backgroundColor: Colors.red),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No weather information to download'), backgroundColor: Colors.orange),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.nightBlue : AppColors.whiteColor,
      appBar: AppBar(
      title:  ResponsiveText(text:S.of(context).weatherForecast,
        style: AppStyles.nunito600style20.copyWith(
            color: isDarkMode ? AppColors.frostWhite : AppColors.whiteColor),baseFontSize: 20,),
        leading: IconButton(onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: _getCurrentLocationWeather,
                child: ResponsiveText(text: S.of(context).getCurrentLocation,
                  style: AppStyles.nunito600style20.copyWith(
                      color: isDarkMode ? AppColors.frostWhite : Colors.black),
                  baseFontSize: 20,),

              ),
              if (_weatherInfo != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ResponsiveText(
                    text:_weatherInfo!,
                    style: AppStyles.nunito600style20.copyWith(
                        color: isDarkMode ? AppColors.frostWhite : Colors.black),baseFontSize: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: _downloadWeatherInfo,
                  child:  ResponsiveText(text:S.of(context).downloadWeatherInfo,style: AppStyles.nunito600style20.copyWith(
                      color: isDarkMode ? AppColors.frostWhite : Colors.black),baseFontSize: 20,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
