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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggingIn = false;

  @override
  void dispose() {
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
        backgroundColor: isDarkMode ? AppColors.stormyGrey : AppColors.skyBlue,
        appBar: AppBar(
          backgroundColor: isDarkMode ? AppColors.nightBlue : AppColors.cloudWhite,
          title: Semantics(
            label: "App Bar title ${S.of(context).weatherForecast}",
            child: Text(
              S.of(context).weatherForecast,
              style: AppStyles.nunito600style20.copyWith(
                color: Theme.of(context).appBarTheme.titleTextStyle?.color,
              ),
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
                      height: 200,
                      width: 200,
                    ),
                  ),
                  ResponsiveText(
                    text: S.of(context).login,
                    style: AppStyles.nunito600style20.copyWith(
                      color: isDarkMode ? AppColors.frostWhite : AppColors.darkBlue,
                    ),
                    baseFontSize: 20,
                  ),
                  const SizedBox(height: 20),
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
                      onPressed: _login,
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
                      child: isLoggingIn
                          ? const CircularProgressIndicator()
                          : ResponsiveText(
                        text: S.of(context).login,
                        style: AppStyles.nunito600style20.copyWith(
                          color: AppColors.whiteColor,
                        ),
                        baseFontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: "  ${S.of(context).signUp}",
                      style: AppStyles.nunito600style20.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(context, Routes.signUpRoute);
                        },
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

  void _login() async {
    setState(() {
      isLoggingIn = true;
    });
    try {
      String email = _emailController.text;
      String password = _passwordController.text;
      if (!_isValidEmail(email)) {
        _showErrorDialog("Invalid email format. Please include '@' and '.com'.");
        return;
      }
      if (password.length < 6) {
        _showErrorDialog("Password must be at least 6 characters long.");
        return;
      }

      User? user = await _auth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        _showErrorDialog("Login failed. Please try again.");
      }
    } catch (e) {
      _showErrorDialog("An error occurred: $e");
    } finally {
      setState(() {
        isLoggingIn = false;
      });
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,}");
    return emailRegex.hasMatch(email);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
