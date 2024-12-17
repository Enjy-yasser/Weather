import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constant/style_app.dart';
import 'package:weather_app/responsive/responsive_text.dart';

import 'constant/colors_app.dart';
import 'constant/routes_app.dart';
import 'generated/l10n.dart';

class Crud extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection("user");
  String textNote="";
  Crud({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Scaffold(
            backgroundColor: isDarkMode ? AppColors.stormyGrey : AppColors.skyBlue,
            appBar: AppBar(
              title: Text(S.of(context).submitData),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.homeRoute);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value){
                    textNote=value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter a note",
                    hintStyle: AppStyles.nunito400style18
                        .copyWith(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await users.add({
                        'temprature': '40',
                        'locationName': 'balteem',
                        'conditionText': textNote
                      }).then((value) => print("user added"));
                    },
                    child: ResponsiveText(
                        text: S.of(context).submitData,
                        style: AppStyles.nunito400style18
                            .copyWith(color: Colors.black),
                        baseFontSize: 20))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
