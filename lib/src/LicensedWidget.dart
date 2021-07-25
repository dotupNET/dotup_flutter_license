import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LicensedWidget<T> extends StatelessWidget {
  final T requiredLicense;
  final Widget child;
  final bool withBanner;
  const LicensedWidget({
    Key? key,
    required this.requiredLicense,
    required this.child,
    this.withBanner = false,
  }) : super(key: key);

  factory LicensedWidget.banner({required T requiredLicense, required Widget child}) {
    return LicensedWidget(
      requiredLicense: requiredLicense,
      child: child,
      withBanner: true,
    );
  }

  // factory LicensedWidget.always({required Widget content}) {
  //   return LicensedWidget(
  //     requiredLicense: null,
  //     widget: content,
  //     withBanner: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

// class LicensedWidget<T> {
//   T? license;
//   Widget content;
//   bool withBanner;

//   LicensedWidget({
//     this.license,
//     required this.content,
//     this.withBanner = false,
//   });

//   factory LicensedWidget.banner({required T license, required Widget content}) {
//     return LicensedWidget(
//       license: license,
//       content: content,
//       withBanner: true,
//     );
//   }

//   factory LicensedWidget.always({required Widget content}) {
//     return LicensedWidget(
//       license: null,
//       content: content,
//       withBanner: true,
//     );
//   }
// }
