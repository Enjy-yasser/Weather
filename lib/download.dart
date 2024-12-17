import 'dart:io';

import 'package:flutter/material.dart';

class WeatherDownloader {
  Future<void> downloadWeatherData(BuildContext context, String fileName, String content) async {
    try {
      final directory = Directory('/storage/emulated/0/Download'); // Downloads folder
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      final filePath = '${directory.path}/$fileName.txt';
      final file = File(filePath);
      await file.writeAsString(content);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Weather details saved to $filePath'), backgroundColor: Colors.green),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save weather details: $e'), backgroundColor: Colors.red),
      );
    }
  }
}
