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
  static var mDeviceInfo = HashMap<String, String>();

  Device(this.context);

  void getDimensions() {
    screenHeight = MediaQuery.of(context).size.height; // device screen height
    screenWidth = MediaQuery.of(context).size.width; // device screen width
    statusBarHeight = MediaQuery.of(context).padding.top;
  }

  static Future<HashMap<String, String>> getDeviceDetails() async {
    final deviceInfo = HashMap<String, String>();
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceInfo.putIfAbsent(_device, () => build.device);
        deviceInfo.putIfAbsent(_brand, () => build.brand);
        deviceInfo.putIfAbsent(_product, () => build.product);
        deviceInfo.putIfAbsent(_fingerprint, () => build.fingerprint);
        deviceInfo.putIfAbsent(_manufacturer, () => build.manufacturer);
        deviceInfo.putIfAbsent(
            _isPhysicalDevice, () => build.isPhysicalDevice.toString());
        deviceInfo.putIfAbsent(_display, () => build.display);
        deviceInfo.putIfAbsent(_model, () => build.model);
        deviceInfo.putIfAbsent(
            _versionInt, () => build.version.sdkInt.toString());
        deviceInfo.putIfAbsent(
            _versionBaseOs, () => build.version.baseOS.toString());
        deviceInfo.putIfAbsent(
            _versionCodeName, () => build.version.codename.toString());
        deviceInfo.putIfAbsent(
            _versionIncremental, () => build.version.incremental.toString());
        deviceInfo.putIfAbsent(
            _versionRelease, () => build.version.release.toString());
        deviceInfo.putIfAbsent(_versionPreviewSdkInt,
            () => build.version.previewSdkInt.toString());
        deviceInfo.putIfAbsent(_versionSecurityPatch,
            () => build.version.securityPatch.toString());
        deviceInfo.putIfAbsent(_identifier, () => build.androidId);
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceInfo.putIfAbsent(_device, () => data.name);
        deviceInfo.putIfAbsent(
            _isPhysicalDevice, () => data.isPhysicalDevice.toString());
        deviceInfo.putIfAbsent(_model, () => data.model);
        deviceInfo.putIfAbsent(_localizedModel, () => data.localizedModel);
        deviceInfo.putIfAbsent(
            _systemVersion, () => data.systemVersion.toString());
        deviceInfo.putIfAbsent(_systemName, () => data.systemName.toString());
        deviceInfo.putIfAbsent(_identifier, () => data.identifierForVendor);
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    mDeviceInfo = deviceInfo;
    return deviceInfo;
  }

  static final _device = 'device'; // _variableName make the variable private
  static final device = 'device'; // this is a public variable
  static final _brand = 'brand';
  static final _product = 'product';
  static final _fingerprint = 'fingerprint';
  static final _manufacturer = 'manufacturer';
  static final _isPhysicalDevice = 'isPhysicalDevice';
  static final _display = 'display';
  static final _model = 'model';
  static final _versionInt = 'versionInt';
  static final _versionBaseOs = 'versionBaseOs';
  static final _versionCodeName = 'versionCodeName';
  static final _versionIncremental = 'versionIncremental';
  static final _versionRelease = 'versionRelease';
  static final _versionPreviewSdkInt = 'versionPreviewSdkInt';
  static final _versionSecurityPatch = 'versionSecurityPatch';
  static final _identifier = 'identifier';

  /// ios
  static final _localizedModel = 'localizedModel';
  static final _systemVersion = 'systemVersion';
  static final _systemName = 'systemName';
}
