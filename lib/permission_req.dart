import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/constant/routes_app.dart';
import 'package:weather_app/constant/style_app.dart';
import 'package:weather_app/responsive/responsive_text.dart';

import 'generated/l10n.dart';

class PermissionReq extends StatefulWidget {
  const PermissionReq({super.key});

  @override
  State<PermissionReq> createState() => _PermissionReqState();
}

Future<bool> _requestPermissions() async {
  AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
  bool storageGranted = false;
  bool locationGranted = false;

  if (build.version.sdkInt >= 30) {
    var storagePermission = await Permission.manageExternalStorage.request();
    storageGranted = storagePermission.isGranted;
  } else {
    var storagePermission = await Permission.storage.request();
    storageGranted = storagePermission.isGranted;
  }
  var locationPermission = await Permission.location.request();
  locationGranted = locationPermission.isGranted;

  return storageGranted && locationGranted;
}

class _PermissionReqState extends State<PermissionReq> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ResponsiveText(
          text: S.of(context).storagePermission,
          style: AppStyles.nunito600style20,
          baseFontSize: 20,
        ),
        leading: IconButton(onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
      ),

      body: ListView(
        children: [
          ListTile(
            title: const Text('Storage Permission'),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
            onTap: () async {
              bool granted = await _requestPermissions();
              if (granted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permissions Granted')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permissions Denied')));
              }
            },
          ),
          ListTile(
            title: const Text('Location Permission'),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
            onTap: () async {
              bool granted = await _requestPermissions();
              if (granted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Permissions Granted')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Permissions Denied')));
              }
            },
          ),
        ],
      ),
    );
  }
}