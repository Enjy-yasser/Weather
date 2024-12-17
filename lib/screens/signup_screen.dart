import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors_app.dart';
import 'package:weather_app/constant/images_app.dart';
import 'package:weather_app/constant/style_app.dart';
import 'package:weather_app/widgets/formcontainer_widget.dart';
import '../constant/routes_app.dart';
import '../firebase_auth.dart';
import '../generated/l10n.dart';
import '../responsive/responsive_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? AppColors.nightBlue : AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: isDarkMode ? AppColors.stormyGrey : AppColors.oceanBlue,
          title: Semantics(
            label: "App Bar title ${S.of(context).weatherForecast}",
            child: ResponsiveText(
              text: S.of(context).weatherForecast,
              style: AppStyles.nunito600style20.copyWith(
                color: isDarkMode ? AppColors.frostWhite : AppColors.whiteColor,
              ), baseFontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth < 600 ? 16 : 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Semantics(
                    label: "Weather App Image",
                    child: Image.asset(
                      AppImages.splashScreen,
                        height: screenWidth<600?150:screenWidth<900 ?200:250,
                        width: screenWidth < 600 ? 150 : screenWidth < 900 ? 200 : 250,
                    ),
                  ),
                  ResponsiveText(
                    text: S.of(context).signUp,
                    style: AppStyles.nunito600style20.copyWith(
                      color: isDarkMode ? AppColors.frostWhite : AppColors.darkBlue,
                    ),
                    baseFontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Semantics(
                      label: S.of(context).usernameController,
                      child: FormContainerWidget(
                        controller: _usernameController,
                        hintText: S.of(context).usernameController,
                        isPasswordField: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Semantics(
                      label: S.of(context).emailController,
                      child: FormContainerWidget(
                        controller: _emailController,
                        hintText: S.of(context).emailController,
                        isPasswordField: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Semantics(
                      label: S.of(context).passwordController,
                      child: FormContainerWidget(
                        controller: _passwordController,
                        hintText: S.of(context).passwordController,
                        isPasswordField: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                      child: isSigningUp
                          ? const CircularProgressIndicator()
                          : ResponsiveText(
                        text: S.of(context).signUp,
                        style: AppStyles.nunito600style20.copyWith(
                          color: isDarkMode ? AppColors.frostWhite : AppColors.darkBlue,
                        ),
                        baseFontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: S.of(context).haveAccount,
                      style: AppStyles.nunito600style20.copyWith(
                        color: isDarkMode ? AppColors.frostWhite : AppColors.darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "  ${S.of(context).login}",
                          style: AppStyles.nunito600style20.copyWith(
                            color: isDarkMode ? AppColors.frostWhite : AppColors.darkBlue,
                            fontWeight: FontWeight.bold,
                            // decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(context, Routes.loginRoute);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });
    try {
      String email = _emailController.text;
      String password = _passwordController.text;

      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    } catch (e) {
      print("Error during sign-up: $e");
    } finally {
      setState(() {
        isSigningUp = false;
      });
    }
  }
}
