// import 'package:dotup_flutter_license/dotup_flutter_license.dart';
// import 'package:dotup_flutter_license/src/LicenseDescriptor.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'ILicensedWidget.dart';
// import 'OnlyFeature.dart';
// import 'OnlyLicensed.dart';

// class Licensed<TLicense, TFeature> extends StatelessWidget {
//   late final List<Widget> widgets;
//   late final LicenseController<TLicense, TFeature> controller;
//   // final LicenseValidator licenseService;
//   // final ValueSetter<LicenseDescriptor>? onLicenseTap;
//   // final ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap;
//   // late final Color _bannerColor;

//   Licensed({
//     Key? key,
//     required this.controller,
//     required this.widgets,
//     // this.onLicenseTap,
//     // this.onFeatureTap,
//     // Color? bannerColor,
//   }) : super(key: key) {
//     // _bannerColor = bannerColor ?? Colors.red;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> childs = [];

//     for (var widget in widgets) {
//       if (widget is ILicensedWidget) {
//         final licensedWidget = widget as ILicensedWidget;
//         licensedWidget.initialize(
//           isLicensed: controller.isLicensed(licensedWidget.feature.license),
//           // onFeatureTap: controller.onFeatureTap,
//           // onLicenseTap: onLicenseTap,
//         );
//       }
//       // if (widget is OnlyLicensed) {
//       //   final licensedWidget = widget as OnlyLicensed<TLicense>;
//       //   licensedWidget.initialize(
//       //     // isLicensed: controller.isLicensed(licensedWidget.license),
//       //     onLicenseTap: controller.onLicenseTap,
//       //     // onLicenseTap: onLicenseTap,
//       //   );
//       // }
//       // if (widget is OnlyFeature) {
//       //   final licensedWidget = widget as OnlyFeature<TFeature>;
//       //   licensedWidget.initialize(
//       //     isLicensed: controller.isLicensed(licensedWidget.feature.license),
//       //     onFeatureTap: controller.onFeatureTap,
//       //     // onLicenseTap: onLicenseTap,
//       //   );
//       // }

//       childs.add(widget);
//     }

//     if (childs.isEmpty) {
//       return Text('License not found.');
//     } else {
//       return Column(
//         children: childs,
//       );
//     }
//   }
// }
