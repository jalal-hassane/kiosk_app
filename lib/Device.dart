import 'dart:collection';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Device {
  BuildContext context;
  var screenHeight = 0.0;
  var screenWidth = 0.0;
  double statusBarHeight = 0.0;

  Device(this.context);

  void getDimensions() {
    screenHeight = MediaQuery.of(context).size.height; // device screen height
    screenWidth = MediaQuery.of(context).size.width; // device screen width
    statusBarHeight = MediaQuery.of(context).padding.top;
  }

  static Future<HashMap<String,String>> getDeviceDetails() async {
    final deviceInfo = HashMap<String,String>();
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceInfo.putIfAbsent('device', () => build.device);
        deviceInfo.putIfAbsent('brand', () => build.brand);
        deviceInfo.putIfAbsent('product', () => build.product);
        deviceInfo.putIfAbsent('fingerprint', () => build.fingerprint);
        deviceInfo.putIfAbsent('manufacturer', () => build.manufacturer);
        deviceInfo.putIfAbsent('isPhysicalDevice', () => build.isPhysicalDevice.toString());
        deviceInfo.putIfAbsent('display', () => build.display);
        deviceInfo.putIfAbsent('model', () => build.model);
        deviceInfo.putIfAbsent('versionInt', () => build.version.sdkInt.toString());
        deviceInfo.putIfAbsent('versionBaseOs', () => build.version.baseOS.toString());
        deviceInfo.putIfAbsent('versionCodeName', () => build.version.codename.toString());
        deviceInfo.putIfAbsent('versionIncremental', () => build.version.incremental.toString());
        deviceInfo.putIfAbsent('versionRelease', () => build.version.release.toString());
        deviceInfo.putIfAbsent('versionPreviewSdkInt', () => build.version.previewSdkInt.toString());
        deviceInfo.putIfAbsent('versionSecurityPatch', () => build.version.securityPatch.toString());
        deviceInfo.putIfAbsent('identifier', () => build.androidId);
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceInfo.putIfAbsent('device', () => data.name);
        deviceInfo.putIfAbsent('isPhysicalDevice', () => data.isPhysicalDevice.toString());
        deviceInfo.putIfAbsent('model', () => data.model);
        deviceInfo.putIfAbsent('localizedModel', () => data.localizedModel);
        deviceInfo.putIfAbsent('systemVersion', () => data.systemVersion.toString());
        deviceInfo.putIfAbsent('systemName', () => data.systemName.toString());
        deviceInfo.putIfAbsent('identifier', () => data.identifierForVendor);
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

    return deviceInfo;
  }
}
