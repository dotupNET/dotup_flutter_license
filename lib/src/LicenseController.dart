import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/material.dart';

import 'LicenseDescriptor.dart';

// abstract class LicenseValidator<T> {
//   bool isLicensed(LicenseDescriptor<T> item);
//   LicenseDescriptor<T> getCurrentLicense();
// }

abstract class LicenseController<TLicense, TFeature> {
  // implements LicenseValidator<TLicense> {
  static late final LicenseController instance;

  late LicenseDescriptor currentLicense;
  late final FeatureDescriptor features;
  ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap;
  ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap;
  // static LicenseController<TL, TF> getInst<TL extends LicenseDescriptor, TF>() => instance as LicenseController<TL,TF>;
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
  // void initialize() {
  //   // void initialize(TLicense currentLicense, FeatureDescriptor<TLicense, TFeature> features) {
  //   LicenseController.instance.currentLicense = currentLicense;
  //   LicenseController.instance.features = features;
  // }

  // LicenseController._();
  // @protected
  // LicenseController.protected();

  void setLicense(LicenseDescriptor value) {
    currentLicense = value;
  }

  LicenseDescriptor getCurrentLicense() {
    return currentLicense;
  }

  // int getLicenseIndex(Object item) {
  //   return item.index;
  // }

  int getCurrentLicenseIndex() {
    return currentLicense.index;
  }

  bool isLicensed<TLicense>(LicenseDescriptor item) {
    return item.index <= currentLicense.index;
    // } else if (item is FeaturedWidget) {
    //   return item.feature.license.index <= currentLicense.index;
  }

  FeatureDescriptor<TFeature> getFeature(TFeature key) {
    return features.findFeature(key) as FeatureDescriptor<TFeature>;
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
