import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/material.dart';

import 'FeatureConfiguration.dart';
import 'LicenseType.dart';

class AppLicenseController extends LicenseController<LicenseType, CustomerFeatureKey> {
  //<LicenseType, CustomerFeatureKey> {
  // static final _instance = AppLicenseController._();
  // static AppLicenseController get current => ;

  static late final AppLicenseController instance = AppLicenseController._();

  AppLicenseController configure(LicenseDescriptor currentLicense) {
    final config = FeatureConfiguration();
    super.initialize(
      currentLicense: currentLicense,
      features: config.customerFeatures,
      controller: this,
      onLicenseTap: (license) => print('Licensed Banner tap $license'),
      onFeatureTap: (feature) => print('Feature Banner tap $feature'),
    );
    return this;
  }

  AppLicenseController._();

  // Color get bannerColor => Colors.red.withOpacity(0.5);

  void onBannerTap(LicenseType licenseType) {
    print('Banner tapped $licenseType');
  }

  @override
  FeatureDescriptor<CustomerFeatureKey> getFeatureFromLicense(LicenseDescriptor license) {
    // final licenseDescriptor = AppLicense.getDescriptor(license.index);
    return FeatureDescriptor<CustomerFeatureKey>(
        key: CustomerFeatureKey.None, license: license, name: '', description: '');
  }
}
