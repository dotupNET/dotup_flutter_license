// ignore_for_file: non_constant_identifier_names

import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/material.dart';

class MyLicenseDescriptor extends LicenseDescriptor<LicenseType> {
  MyLicenseDescriptor({
    required LicenseType key,
    required String label,
    required Color color,
  }) : super(
          color: color,
          key: key,
          label: label,
        );

  @override
  int get index => key.index;
}

enum LicenseType {
  None,
  Free,
  Basic,
  Pro,
  Enterprise,
}

final licenseColor = Colors.red.withOpacity(0.8);

class AppLicense {
  static LicenseDescriptor<LicenseType> get None =>
      MyLicenseDescriptor(key: LicenseType.None, label: 'None', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Free =>
      MyLicenseDescriptor(key: LicenseType.Free, label: 'Free', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Basic =>
      MyLicenseDescriptor(key: LicenseType.Basic, label: 'Basic', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Pro =>
      MyLicenseDescriptor(key: LicenseType.Pro, label: 'Pro', color: licenseColor);
  static LicenseDescriptor<LicenseType> get Enterprise =>
      MyLicenseDescriptor(key: LicenseType.Enterprise, label: 'Enterprise', color: licenseColor);

  static List<LicenseDescriptor<LicenseType>> get values => [None, Free, Basic, Pro, Enterprise];


}
