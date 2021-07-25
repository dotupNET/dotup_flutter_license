import 'package:dotup_flutter_license/src/LicenseController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'IndexedExtensions.dart';

class WithLicense<T> extends StatelessWidget {
  final T currentLicense;
  final T requiredLicense;
  final Widget widget;
  final bool withBanner;

  const WithLicense({
    Key? key,
    required this.currentLicense,
    required this.requiredLicense,
    required this.widget,
    this.withBanner = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final requiredIndex = requiredLicense.index;
    final licenseIndex = currentLicense.index;

    if (requiredIndex <= licenseIndex) {
      return widget;
    } else if (withBanner == true) {
      return ClipRect(
        child: AbsorbPointer(
          child: Stack(children: [
            widget,
            Banner(
              message: describeEnum(requiredLicense as dynamic),
              location: BannerLocation.topStart,
            ),
          ]),
        ),
      );
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
