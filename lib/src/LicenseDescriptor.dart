// typedef LicenseList = List<LicenseDescriptor>;

import 'package:flutter/painting.dart';

class LicenseDescriptor<T> {
  final T key;
  final int index;
  final String label;
  final Color color;
  LicenseDescriptor({required this.key, required this.index, required this.label, required this.color});
}
