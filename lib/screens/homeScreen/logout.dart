import 'package:flutter/material.dart';

import '../../constant/colors_app.dart';
import '../../constant/routes_app.dart';
import '../../constant/style_app.dart';
import '../../generated/l10n.dart';
import '../../responsive/responsive_text.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: ResponsiveText(
          text:S.of(context).logout,
          style: AppStyles.nunito600style20.copyWith(
              color: isDarkMode ? AppColors.frostWhite : Colors.black),baseFontSize: 20,
        ),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveText(
              text:S.of(context).logoutSta,
              style: AppStyles.nunito600style20.copyWith(
                  color: isDarkMode ? AppColors.frostWhite : Colors.black),baseFontSize: 20,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child:ResponsiveText(
                    text:"${S.of(context).yes}${S.of(context).logout}",
                    style: AppStyles.nunito600style20.copyWith(
                        color: isDarkMode ? AppColors.frostWhite : Colors.black),baseFontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                 child:  ResponsiveText(
                    text:S.of(context).cancel,
                    style: AppStyles.nunito600style20.copyWith(
                        color: isDarkMode ? AppColors.frostWhite : Colors.black),baseFontSize: 20,
                  ),                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
