import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors_app.dart';
import 'package:weather_app/constant/images_app.dart';
import 'package:weather_app/constant/routes_app.dart';
import '../constant/style_app.dart';
import '../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Future.delayed(const Duration(seconds: 6),(){
      Navigator.pushReplacementNamed(context, Routes.signUpRoute);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.stormyGrey : AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Semantics(
                  label: "Splash Screen Image of Weather",
                    child: Image.asset(AppImages.splashScreen,height: screenWidth<600?150:screenWidth<900 ?200:250,
                      width: screenWidth < 600 ? 150 : screenWidth < 900 ? 200 : 250,)),
              ),
            ),
            Semantics(
                label: S.of(context).weatherApplication,
              child: Text(S.of(context).weatherApplication,style:AppStyles.nunito400style18.copyWith(color: isDarkMode ? AppColors.whiteColor : AppColors.oceanBlue,
              fontSize: screenWidth < 600  ? 16 : screenWidth < 900 ? 18 : 20,),)),
          ],
        ),
      ),
    );
  }
}
