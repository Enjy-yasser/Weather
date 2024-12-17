import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/constant/api_app.dart';

class WeatherDownloadPage extends StatefulWidget {
  @override
  _WeatherDownloadPageState createState() => _WeatherDownloadPageState();
}

class _WeatherDownloadPageState extends State<WeatherDownloadPage> {
  bool isLoading = false;
  final AppApi apiServices = AppApi(); // Create an instance

  // Function to fetch and save weather data as a text file
  Future<void> _downloadWeatherData(String city) async {
    setState(() {
      isLoading = true;
    });

    try {
      // Fetch weather data from the API
      var weatherData = await apiServices.weatherApiCall(city);

      // Save the data to a file
      String weatherReport = _formatWeatherData(weatherData);

      // Get the app's external directory (does not require MANAGE_EXTERNAL_STORAGE)
      final directory = await getExternalStorageDirectory();  // Scoped storage access
      if (directory != null) {
        final file = File('${directory.path}/${city}_weather_report.txt');
        await file.writeAsString(weatherReport);

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weather data saved as text file')));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error fetching weather data')));
    }
  }

  // Helper function to format weather data as text
  String _formatWeatherData(Map<String, dynamic> weatherData) {
    return '''
Location: ${weatherData['location']['name']}, ${weatherData['location']['region']}, ${weatherData['location']['country']}
Time: ${weatherData['location']['localtime']}
Condition: ${weatherData['current']['condition']['text']}
Temperature: ${weatherData['current']['temp_c']}°C
''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download Weather Data"),
        actions: [
          if (isLoading) CircularProgressIndicator(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter City Name"),
            TextField(
              onSubmitted: (city) {
                // Call the function to download data when the user submits a city
                _downloadWeatherData(city);
              },
            ),
            ElevatedButton(
              onPressed: () {
                // You can call the function directly, or let the user input the city.
                _downloadWeatherData('London');  // Example city
              },
              child: Text("Download Weather Data"),
            ),
          ],
        ),
      ),
    );
  }
}
