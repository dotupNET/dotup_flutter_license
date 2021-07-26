import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dotup_flutter_license.dart';
import 'ILicensedWidget.dart';

class WithLicense<TLicense, TFeature> extends StatelessWidget implements LateLicense<TLicense> {
  // final int currentLicense;
  late final TLicense license;
  // late final LicenseController<TLicense, TFeature> controller;
  late final FeatureDescriptor<TLicense, TFeature>? feature;
  final Widget child;
  final bool withBanner;
  final ValueSetter<TLicense>? onLicenseTap;
  final ValueSetter<FeatureDescriptor<TLicense, TFeature>>? onFeatureTap;
  late final Color _bannerColor;
  late final bool isLicensed;

  WithLicense({
    Key? key,
    TLicense? license,
    TFeature? feature,
    // LicenseController<TLicense, TFeature>? controller,
    bool? isLicensed,
    required this.child,
    this.withBanner = false,
    this.onLicenseTap,
    this.onFeatureTap,
    Color? bannerColor,
  }) : super(key: key) {
    _bannerColor = bannerColor ?? Colors.red;

    this.feature = feature == null
        ? null
        : LicenseController.instance.getFeature(feature)! as FeatureDescriptor<TLicense, TFeature>;

    // if (controller != null) {
    //   this.controller = controller;
    // }

    this.license = license ?? this.feature!.license;

    if (isLicensed != null) {
      this.isLicensed = isLicensed;
    }
  }

  void initialize(bool isLicensed) {
    // this.requiredLicense = requiredLicense;
    this.isLicensed = isLicensed;
  }

  factory WithLicense.banner({
    // required int currentLicense,
    TFeature? feature,
    TLicense? license,
    // LicenseController<TLicense, TFeature>? controller,
    bool? isLicensed,
    required Widget child,
    ValueSetter<TLicense>? onBannerTap,
    Color? bannerColor,
  }) {
    return WithLicense(
      feature: feature,
      // controller: controller,
      // currentLicense: currentLicense,
      license: license,
      isLicensed: isLicensed,
      child: child,
      // onBannerTap: onBannerTap,
      withBanner: true,
      bannerColor: bannerColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLicensed) {
      return child;
    } else if (withBanner == true) {
      if (onLicenseTap == null && onFeatureTap == null) {
        return ClipRect(
          child: AbsorbPointer(
            child: Stack(children: [
              child,
              Banner(
                message: describeEnum(license as dynamic),
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
              if (feature != null && onFeatureTap != null) {
                onFeatureTap!(feature!);
              } else if (onLicenseTap != null) {
                onLicenseTap!(license);
              }
            },
            child: AbsorbPointer(
              child: Stack(
                children: [
                  child,
                  Banner(
                    message: describeEnum(license as dynamic),
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
