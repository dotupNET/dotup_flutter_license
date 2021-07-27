import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/material.dart';

import 'LicenseDescriptor.dart';

abstract class LicenseController<TLicense, TFeature> {
  static late final LicenseController instance;

  late LicenseDescriptor currentLicense;
  late final FeatureDescriptor features;
  ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap;
  ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap;
  
  LicenseController();

  FeatureDescriptor<TFeature> getFeatureFromLicense(LicenseDescriptor license);

  void initialize({
    required LicenseController<TLicense, TFeature> controller,
    required LicenseDescriptor currentLicense,
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

  void setLicense(LicenseDescriptor value) {
    currentLicense = value;
  }

  LicenseDescriptor getCurrentLicense() {
    return currentLicense;
  }

  int getCurrentLicenseIndex() {
    return currentLicense.index;
  }

  bool isLicensed<TLicense>(LicenseDescriptor item) {
    return item.index <= currentLicense.index;
  }

  FeatureDescriptor<TFeature> getFeature(TFeature key) {
    return features.findFeature(key) as FeatureDescriptor<TFeature>;
  }
}
