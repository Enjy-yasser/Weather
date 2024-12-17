import 'package:flutter/material.dart';
import 'package:weather_app/constant/api_app.dart';
import 'package:weather_app/constant/colors_app.dart';
import 'package:weather_app/constant/images_app.dart';
import 'package:weather_app/constant/routes_app.dart';
import '../generated/l10n.dart';
import '../responsive/responsive_text.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<int>? onTap;
  final int? currentIndex;

  const CustomDrawer({super.key, this.onTap, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AppApi services = AppApi();

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Widget socialMediaButton(String tooltip, String image, String url) {
      return Semantics(
        label: "$tooltip icon tap to navigate to $tooltip page",
        child: IconButton(
          onPressed: () => services.openUrl(url),
          tooltip: "Open $tooltip Page",
          icon: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(image),
          ),
        ),
      );
    }

    Color drawerBackgroundColor = isDarkMode ? AppColors.stormyGrey : AppColors.skyBlue;

    return SafeArea(
      child: Drawer(
        child: Container(
          color: drawerBackgroundColor, // Set the drawer background color
          child: ListView(  // Change Column to ListView to make the content scrollable
            children: [
              // Drawer Header
              DrawerHeader(
                decoration: BoxDecoration(
                  color: isDarkMode ? AppColors.nightBlue : AppColors.cloudWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      child: ResponsiveText(
                        text: S.of(context).weatherApplication,
                        style: theme.textTheme.bodyMedium!,
                        baseFontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              // Navigation List (Scrollable ListView)
              ListTile(
                leading: const Icon(Icons.home),
                title: ResponsiveText(
                  text: S.of(context).homePage,
                  style: theme.textTheme.bodyMedium!,
                  baseFontSize: 16,
                ),
                selected: currentIndex == 0,
                onTap: () => onTap?.call(0),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: ResponsiveText(
                  text: S.of(context).requestPermissions,
                  style: theme.textTheme.bodyMedium!,
                  baseFontSize: 16,
                ),
                onTap: () {
                  // Navigate to the PermissionReq page
                  Navigator.pushReplacementNamed(context,Routes.permissionRoute);
                },
              ),ListTile(
                leading: const Icon(Icons.report),
                title: ResponsiveText(
                  text: S.of(context).submitData,
                  style: theme.textTheme.bodyMedium!,
                  baseFontSize: 16,
                ),
                onTap: () {
                  // Navigate to the PermissionReq page
                  Navigator.pushReplacementNamed(context,Routes.crudRoute);
                },
              ),ListTile(
                leading: const Icon(Icons.search),
                title: ResponsiveText(
                  text: S.of(context).searchPage,
                  style: theme.textTheme.bodyMedium!,
                  baseFontSize: 16,
                ),
                onTap: () {
                  // Navigate to the PermissionReq page
                  Navigator.pushReplacementNamed(context,Routes.searchRoute);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          socialMediaButton(
                            "Facebook",
                            AppImages.facebookImage,
                            "https://web.facebook.com/TheWeatherChannel",
                          ),
                          socialMediaButton(
                            "Instagram",
                            AppImages.instagramImage,
                            "https://www.instagram.com/weatherchannel",
                          ),
                          socialMediaButton(
                            "X",
                            AppImages.xImage,
                            "https://x.com/weatherchannel",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    ResponsiveText(
                      text: "App Version 1.0.0",
                      style: theme.textTheme.bodySmall!,
                      baseFontSize: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
