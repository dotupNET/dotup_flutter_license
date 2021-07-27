import 'package:dotup_flutter_license/src/LicenseDescriptor.dart';
import 'package:flutter/material.dart';

import '../dotup_flutter_license.dart';

// abstract class LateLicense {
//   void initialize({
//     required bool isLicensed,
//     ValueSetter<LicenseDescriptor>? onLicenseTap,
//     ValueSetter<FeatureDescriptor>? onFeatureTap,
//   });
// }

abstract class ILicensedWidget<TFeature> {
  //implements LateLicense {
  FeatureDescriptor<TFeature> get feature;
  Widget get child;
  bool get withBanner;
  void initialize({
    required bool isLicensed,
    // ValueSetter<LicenseDescriptor>? onLicenseTap,
    ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap,
  });

  // ValueSetter<LicenseDescriptor>? get onLicenseTap;
  // ValueSetter<TFeature>? get onFeatureTap;
  // int getLicenseIndex();

  // TModel getModel<TModel>();
}
// factory LicensedWidget.always({required Widget content}) {
