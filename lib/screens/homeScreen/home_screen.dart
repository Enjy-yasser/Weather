import 'package:flutter/material.dart';
import 'package:weather_app/constant/api_app.dart';
import 'package:weather_app/responsive/responsive_layout.dart';
import 'package:weather_app/screens/homeScreen/home_mobile.dart';
import 'package:weather_app/screens/homeScreen/home_tablet.dart';
import 'package:weather_app/screens/homeScreen/home_web.dart';
import 'package:weather_app/widgets/drawer.dart';

import '../../generated/l10n.dart';
import '../../model/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the selected index for navigation
  void _onDrawerItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selection
  }


  @override
  Widget build(BuildContext context) {
    final AppApi appApi = AppApi();
    return FutureBuilder<List<WeatherModel>>(
      future:fetchWeatherForCities(appApi) ,
        builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Semantics(label:"Loading ",child: const Center(child: CircularProgressIndicator(),));
        }else if(snapshot.hasError)
          {
            return Semantics(label:"error",child: Center(child: Text(" error ${snapshot.error}"),));

          }else if (snapshot.hasData) {
          // Parse the fetched JSON into a WeatherModel
          List<WeatherModel> weatherData = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title:  Text(S.of(context).weatherForecast),
            ),
            drawer: CustomDrawer(
              currentIndex: _currentIndex,
              onTap: _onDrawerItemTap,
            ),
            body: ResponsiveLayout(
                mobileLayout: Semantics(label: "Mobile Layout of home screen",
                  child: HomeMobile(weatherData: weatherData),),
                tabletLayout: Semantics(label: "Tablet Layout of home screen",
                  child: HomeTablet(weatherData: weatherData,),),
                webLayout: Semantics(
                  label: "Mobile Layout of home screen", child:  HomeWeb(weatherData: weatherData,),)
            ),
          );
  }else
    {
      return Center(child: Text(S.of(context).noDataAvailable),);
    }
        },
    );
  }

  Future<List<WeatherModel>> fetchWeatherForCities(AppApi appApi) async {
    List<WeatherModel> weatherData = [];
    for (String city in appApi.cities) {
      try {
        var data = await appApi.weatherApiCall(city);
        weatherData.add(WeatherModel.fromJson(data));
      } catch (e) {
        // print("Error fetching data for $city: $e");
      }
    }
    return weatherData;
  }
}