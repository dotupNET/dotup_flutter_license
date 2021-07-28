// ignore_for_file: non_constant_identifier_names

import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/material.dart';

enum LicenseType {
  None,
  Free,
  Basic,
  Pro,
  Enterprise,
}

final licenseColor = Colors.red.withOpacity(0.8);

class AppLicense {
  static LicenseDescriptor<LicenseType> get None => LicenseDescriptor<LicenseType>(
      key: LicenseType.None, index: LicenseType.None.index, label: 'None', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Free => LicenseDescriptor<LicenseType>(
      key: LicenseType.Free, index: LicenseType.Free.index, label: 'Free', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Basic => LicenseDescriptor<LicenseType>(
      key: LicenseType.Basic, index: LicenseType.Basic.index, label: 'Basic', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Pro => LicenseDescriptor<LicenseType>(
      key: LicenseType.Pro, index: LicenseType.Pro.index, label: 'Pro', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Enterprise => LicenseDescriptor<LicenseType>(
      key: LicenseType.Enterprise, index: LicenseType.Enterprise.index, label: 'Enterprise', color: licenseColor);

  static List<LicenseDescriptor<LicenseType>> get values => [None, Free, Basic, Pro, Enterprise];

  static LicenseDescriptor<LicenseType> getDescriptor(int? index) {
    return values.firstWhere((element) => element.index == index);
  }
}
