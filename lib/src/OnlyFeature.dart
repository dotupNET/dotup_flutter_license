import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dotup_flutter_license.dart';

class OnlyFeature<TFeature> extends StatelessWidget {
  // final int currentLicense;
  late final FeatureDescriptor<TFeature> feature;
  // late final LicenseController<TLicense, TFeature> controller;
  final Widget child;
  final bool withBanner;
  // late final ValueSetter<FeatureDescriptor>? _onLicenseTap;
  late final ValueSetter<FeatureDescriptor<TFeature>>? _onFeatureTap;
  late final Color _bannerColor;
  late final bool isLicensed;

  OnlyFeature({
    Key? key,
    required TFeature feature,
    bool? isLicensed,
    required this.child,
    this.withBanner = false,
    ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap,
    Color? bannerColor,
  }) : super(key: key) {
    _bannerColor = bannerColor ?? Colors.red;

    final featureDescriptor = LicenseController.instance.getFeature(feature);
    this.feature = featureDescriptor as FeatureDescriptor<TFeature>;
    // if (license == null) {
    //   this.license = featureDescriptor!.license;
    // } else {
    //   this.license = license;
    // }
    // if (controller != null) {
    //   this.controller = controller;
    // }
    // if (license != null) {
    //   this.license = license;
    // }
    final controller = LicenseController.instance as LicenseController<dynamic, TFeature>;

    _onFeatureTap = onFeatureTap ?? controller.onFeatureTap;

    this.isLicensed = isLicensed ?? controller.isLicensed(this.feature.license);
  }

  factory OnlyFeature.banner({
    required TFeature feature,
    bool? isLicensed,
    required Widget child,
    ValueSetter<FeatureDescriptor<TFeature>>? onBannerTap,
    Color? bannerColor,
  }) {
    return OnlyFeature<TFeature>(
      // controller: controller,
      // currentLicense: currentLicense,
      feature: feature,
      isLicensed: isLicensed,
      child: child,
      // onBannerTap: onBannerTap,
      withBanner: true,
      bannerColor: bannerColor,
    );
  }

  factory OnlyFeature.hidden({required TFeature feature, required Widget child}) {
    return OnlyFeature<TFeature>(
      feature: feature,
      // feature: f,
      child: child,
      withBanner: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    if (isLicensed) {
      return child;
    } else if (withBanner == true) {
      if (_onFeatureTap == null) {
        return ClipRect(
          child: AbsorbPointer(
            child: Stack(children: [
              child,
              Banner(
                message: feature.license.label,
                location: BannerLocation.topStart,
                color: _bannerColor,
              ),
            ]),
          ),
        );
      } else {
        return ClipRect(
          child: InkWell(
            onTap: () {
              if (_onFeatureTap != null) {
                _onFeatureTap!(feature);
                // } else if (_onLicenseTap != null) {
                //   _onLicenseTap!(license);
              }
            },
            child: AbsorbPointer(
              child: Stack(
                children: [
                  child,
                  Banner(
                    message: feature.license.label,
                    location: BannerLocation.topStart,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }

  // @override
  // void initialize<TLicense, TFeature>({
  //   required bool isLicensed,
  //   ValueSetter<FeatureDescriptor>? onLicenseTap,
  //   ValueSetter<FeatureDescriptor>? onFeatureTap,
  // }) {
  //   this.isLicensed = isLicensed;
  //   this._onFeatureTap = onFeatureTap ;
  //   this._onLicenseTap = onLicenseTap;
  // }
}

// class LicensedWidget2<T> extends StatelessWidget {
//   late final LicenseController<T> _licenseController;
//   final T? license;
//   final Widget widget;
//   final bool withBanner;

//   LicensedWidget2({
//     Key? key,
//     LicenseController<T>? licenseController,
//     this.license,
//     required this.widget,
//     this.withBanner = false,
//   }) : super(key: key) {
//     _licenseController = licenseController == null ? LicenseController<T>() : licenseController;
//   }

//   factory LicensedWidget2.banner({
//     required T license,
//     required Widget content,
//     LicenseController<T>? licenseController,
//   }) {
//     return LicensedWidget2(
//       licenseController: licenseController,
//       widget: content,
//       withBanner: true,
//     );
//   }

//   factory LicensedWidget2.always({required Widget content}) {
//     return LicensedWidget2(
//       widget: content,
//       withBanner: true,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final requiredIndex = _licenseController.getLicenseIndex();
//     final licenseIndex = license?.index ?? 0;

//     if (requiredIndex <= licenseIndex) {
//       return widget;
//     } else if (withBanner == true) {
//       return ClipRect(
//         child: AbsorbPointer(
//           child: Stack(children: [
//             widget,
//             Banner(
//               message: describeEnum(license as dynamic),
//               location: BannerLocation.topStart,
//             ),
//           ]),
//         ),
//       );
//     } else {
//       throw 'error';
//     }
//   }
// }
