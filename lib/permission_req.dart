 import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionReq {


  Future<bool> requestPermissions() async {
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
}
