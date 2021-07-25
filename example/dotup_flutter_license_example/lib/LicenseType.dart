import 'package:flutter/foundation.dart';

enum LicenseType {
  None,
  Free,
  Basic,
  Pro,
  Enterprise,
}

extension LicenseTypeExtension on LicenseType {
  String get name => describeEnum(this);
}
