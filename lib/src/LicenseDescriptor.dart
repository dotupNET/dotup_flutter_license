// typedef LicenseList = List<LicenseDescriptor>;

import 'package:flutter/painting.dart';

class LicenseDescriptor<T> {
  final T key;
  final int index;
  final String label;
  final Color color;
  LicenseDescriptor({required this.key, required this.index, required this.label, required this.color});

  @override
  bool operator ==(Object? other) {
    return other is LicenseDescriptor<T> && this.index == other.index;
  }

  @override
  int get hashCode => label.hashCode;

  /// Whether [other] index is numerically smaller than this number.
  ///
  /// If either operand is the [double] NaN, the result is always false.
  bool operator <(LicenseDescriptor<T> other) => index < other.index;

  /// Whether [other] index is numerically smaller than or equal to this number.
  ///
  /// If either operand is the [double] NaN, the result is always false.
  bool operator <=(LicenseDescriptor<T> other) => index <= other.index;

  /// Whether [other] index is numerically greater than this number.
  ///
  /// If either operand is the [double] NaN, the result is always false.
  bool operator >(LicenseDescriptor<T> other) => index > other.index;

  /// Whether [other] index is numerically greater than or equal to this number.
  ///
  /// If either operand is the [double] NaN, the result is always false.
  bool operator >=(LicenseDescriptor<T> other) => index >= other.index;
}
