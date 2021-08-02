import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/material.dart';

import 'LicenseDescriptor.dart';

abstract class LicenseController<TLicense, TFeature> {
  static late final LicenseController instance;

  late LicenseDescriptor<TLicense> currentLicense;
  late final FeatureDescriptor<TFeature> features;
  ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap;
  ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap;

  LicenseController();

  FeatureDescriptor<TFeature> getFeatureFromLicense(LicenseDescriptor<TLicense> license);

  void initialize({
    required LicenseController<TLicense, TFeature> controller,
    required LicenseDescriptor<TLicense> currentLicense,
    required FeatureDescriptor<TFeature> features,
    ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap,
    ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap,
  }) {
    LicenseController.instance = controller;
    final fuck = LicenseController.instance as LicenseController<TLicense, TFeature>;
    fuck.features = features;
    fuck.currentLicense = currentLicense;
    fuck.onFeatureTap = onFeatureTap;
    fuck.onLicenseTap = onLicenseTap;
  }

  void setLicense(LicenseDescriptor<TLicense> value) {
    currentLicense = value;
  }

  LicenseDescriptor<TLicense> getCurrentLicense() {
    return currentLicense;
  }

  int getCurrentLicenseIndex() {
    return currentLicense.index;
  }

  bool isLicensed<TLicense>(LicenseDescriptor<TLicense> item) {
    return item.index <= currentLicense.index;
  }

  FeatureDescriptor<TFeature> getFeature(TFeature key) {
    return features.findFeature(key);
  }
}
