import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dotup_flutter_license.dart';
import 'ILicensedWidget.dart';
import 'LicenseDescriptor.dart';

class OnlyLicensed<TLicense> extends StatelessWidget {
  // final int currentLicense;
  late final LicenseDescriptor<TLicense> license;
  // late final LicenseController<TLicense, TFeature> controller;
  final Widget child;
  final bool withBanner;
  // late final ValueSetter<LicenseDescriptor>? _onLicenseTap;
  late final ValueSetter<LicenseDescriptor<TLicense>>? _onLicenseTap;
  late final Color _bannerColor;
  late final bool isLicensed;

  OnlyLicensed({
    Key? key,
    required this.license,
    bool? isLicensed,
    required this.child,
    this.withBanner = false,
    ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap,
    Color? bannerColor,
  }) : super(key: key) {
    _bannerColor = bannerColor ?? Colors.red;

    final controller = LicenseController.instance as LicenseController<TLicense, dynamic>;

    _onLicenseTap = onLicenseTap ?? controller.onLicenseTap;

    this.isLicensed = isLicensed ?? controller.isLicensed(this.license);
  }

  factory OnlyLicensed.banner({
    required LicenseDescriptor<TLicense> license,
    bool? isLicensed,
    required Widget child,
    ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap,
    Color? bannerColor,
  }) {
    return OnlyLicensed<TLicense>(
      // controller: controller,
      // currentLicense: currentLicense,
      license: license,
      isLicensed: isLicensed,
      child: child,
      onLicenseTap: onLicenseTap,
      withBanner: true,
      bannerColor: bannerColor,
    );
  }

  factory OnlyLicensed.hidden({required LicenseDescriptor<TLicense> license, required Widget child}) {
    return OnlyLicensed<TLicense>(
      license: license,
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
      if (_onLicenseTap == null) {
        return ClipRect(
          child: AbsorbPointer(
            child: Stack(children: [
              child,
              Banner(
                message: license.label,
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
              if (_onLicenseTap != null) {
                _onLicenseTap!(license);
                // } else if (_onLicenseTap != null) {
                //   _onLicenseTap!(license);
              }
            },
            child: AbsorbPointer(
              child: Stack(
                children: [
                  child,
                  Banner(
                    message: license.label,
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
  // void initialize(
  //     {required bool isLicensed,
  //     ValueSetter<LicenseDescriptor>? onLicenseTap,
  //     ValueSetter<FeatureDescriptor<TLicense, TFeature>>? onFeatureTap}) {
  //   // TODO: implement initialize
  // }

  // @override
  // void initialize<TLicense, TFeature>({
  //   required bool isLicensed,
  //   ValueSetter<LicenseDescriptor>? onLicenseTap,
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
