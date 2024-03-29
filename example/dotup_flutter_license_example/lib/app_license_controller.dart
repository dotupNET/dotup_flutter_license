import 'package:dotup_flutter_license/dotup_flutter_license.dart';

import 'feature_configuration.dart';
import 'license_type.dart';

class AppLicenseController extends LicenseController<LicenseType, FeatureKey> {
  //<LicenseType, CustomerFeatureKey> {
  // static final _instance = AppLicenseController._();
  // static AppLicenseController get current => ;
  final config = FeatureConfiguration();

  static late final AppLicenseController instance = AppLicenseController._();

  AppLicenseController configure(LicenseDescriptor<LicenseType> currentLicense) {
    super.initialize(
      currentLicense: currentLicense,
      // features: config.customerFeatures,
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

  // @override
  // FeatureDescriptor<CustomerFeatureKey> getFeatureFromLicense(LicenseDescriptor<LicenseType> license) {
  //   // final licenseDescriptor = AppLicense.getDescriptor(license.index);
  //   return FeatureDescriptor<CustomerFeatureKey>(
  //       key: CustomerFeatureKey.None, license: license, name: '', description: '');
  // }

  @override
  FeatureDescriptor<FeatureKey> getFeature(FeatureKey key) {
    return config.getDescriptor(key);
  }
}
