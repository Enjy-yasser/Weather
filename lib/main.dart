import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/constant/routes_app.dart';
import 'package:weather_app/constant/theme_app.dart';
import 'package:weather_app/screens/splash_screen.dart';

import 'firebase_push_notifications.dart';
import 'generated/l10n.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
        apiKey: "AIzaSyDFwJh7FXnmLcL7wXFNspVQfEBVMx2dN-M",
        authDomain: "itss-22.firebaseapp.com",
        databaseURL: "https://itss-22-default-rtdb.firebaseio.com",
        projectId: "itss-22",
        storageBucket: "itss-22.appspot.com",
        messagingSenderId: "1067727676484",
        appId: "1:1067727676484:web:3dc78550e299471f434811",
        measurementId: "G-5CLRSVRXJ0"
    ) : null,
  );

  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Method a check device's locale is supported
  Locale _getLocaleBasedOnDevice(BuildContext context) {
    // Retrieve the current device locale safely
    Locale deviceLocale = View.of(context).platformDispatcher.locale;

    for (Locale supportedLocale in S.delegate.supportedLocales) {
      if (supportedLocale.languageCode == deviceLocale.languageCode) {
        return supportedLocale;
      }
    }
    // Default to the first supported locale if device locale is not supported
    return S.delegate.supportedLocales.first;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          Locale appLocale = _getLocaleBasedOnDevice(context);

          return MaterialApp(
            onGenerateRoute: Routes.getRoute,
            initialRoute: Routes.splashRoute,
            debugShowCheckedModeBanner: false,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: ThemeMode.system,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // locale: const Locale('ar'),
            locale: appLocale,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
