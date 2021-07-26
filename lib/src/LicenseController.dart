import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/material.dart';

extension _IndexedExtension on dynamic {
  int get index => this.index;
}


abstract class LicenseValidator<T> {
  bool isLicensed(T item);
  T getCurrentLicense();
}

class LicenseController<TLicense, TFeature> implements LicenseValidator<TLicense> {
  static late final LicenseController instance = LicenseController._();

  void initialize(TLicense currentLicense, FeatureDescriptor<TLicense, TFeature> features) {
    LicenseController.instance.currentLicense = currentLicense;
    LicenseController.instance.features = features;
  }

  late TLicense currentLicense;
  late final FeatureDescriptor<TLicense, TFeature>? features;

  LicenseController._();
  @protected
  LicenseController.protected();

  void setLicense(TLicense value) {
    currentLicense = value;
  }

  TLicense getCurrentLicense() {
    return currentLicense;
  }

  int getLicenseIndex(Object item) {
    return item.index;
  }

  int getCurrentLicenseIndex() {
    return currentLicense.index;
  }

  bool isLicensed(TLicense item) {
    if (item is LicensedWidget) {
      return item.license.index <= currentLicense.index;
      // } else if (item is FeaturedWidget) {
      //   return item.feature.license.index <= currentLicense.index;
    } else {
      return true;
    }
  }

  FeatureDescriptor<TLicense, TFeature>? getFeature(TFeature key) {
    return features?.findFeature(key);
  }
}

// class LicenseController<TLicense, TFeature> extends LicenseController<TLicense> {
//   late final FeatureDescriptor<TLicense, TFeature> features;

//   static late final LicenseController instance = LicenseController._();

//   @protected
//   LicenseController.protected() : super.protected();

//   LicenseController._() : super.protected();

//   static void initialize<TLicense, TFeature>(FeatureDescriptor<TLicense, TFeature> features, TLicense currentLicense) {
//     LicenseController.instance.features = features;
//     LicenseController.initialize(currentLicense);
//   }

//   FeatureDescriptor<TLicense, TFeature> getFeature(TFeature key) {
//     return features.findFeature(key);
//   }
// }

// class LicenseController<TLicense, TFeature> extends LicenseController<TLicense> {
//   LicenseController(TLicense currentLicense) : super(currentLicense);

//   @override
//   TLicense? getLicense(Object item) {
//     if (item is LicensedWidget<FeatureDescriptor<TLicense, TFeature>>) {
//       return item.model.license;
//     }
//   }
//   // T? getLicense(Object item) {
//   //   if (item is LicensedWidget<FeatureDescriptor<TLicense, TFeature>>) {
//   //     return item.requiredLicense.license;
//   //   }
//   // }

//   @override
//   bool isLicensed(Object item) {
//     if (item is ILicensedWidget<FeatureDescriptor<TLicense, TFeature>>) {
//       return item.model.license.index <= currentLicense.index;
//     } else {
//       return true;
//     }
//   }
//   // TLicense? getLicenseIndex(Object item) {
//   //   if (item is TFeature) {
//   //     return 0; //item.license.index;
//   //   }
//   // }
// }
