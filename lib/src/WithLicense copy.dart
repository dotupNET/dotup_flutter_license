// import 'package:dotup_flutter_license/src/LicenseController_old.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '../../dotup_flutter_license.dart';
// import '../IndexedExtensions.dart';

// class WithFeature<TFeature extends FeatureDescriptor, TLicense> extends StatelessWidget {
//   // final int currentLicense;
//   final TFeature feature;
//   final Widget child;
//   final bool withBanner;
//   final ValueSetter<TFeature>? onBannerTap;
//   final bool isLicensed;
//   late final Color _bannerColor;

//   WithFeature({
//     Key? key,
//     // required this.currentLicense,
//     required this.feature,
//     required this.child,
//     this.withBanner = false,
//     this.onBannerTap,
//     Color? bannerColor,
//     required this.isLicensed,
//   }) {
//     _bannerColor = bannerColor ?? Colors.red;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return WithLicense(
//       requiredLicense: feature.license,
//       isLicensed: isLicensed,
//       child: child,
//     );
//   }
// }

// class WithLicense<T> extends StatelessWidget {
//   // final int currentLicense;
//   final T requiredLicense;
//   final Widget child;
//   final bool withBanner;
//   final ValueSetter<T>? onBannerTap;
//   late final Color _bannerColor;
//   final bool isLicensed;

//   WithLicense({
//     Key? key,
//     // required this.currentLicense,
//     required this.requiredLicense,
//     required this.isLicensed,
//     required this.child,
//     this.withBanner = false,
//     this.onBannerTap,
//     Color? bannerColor,
//   }) : super(key: key) {
//     _bannerColor = bannerColor ?? Colors.red;
//   }

//   factory WithLicense.banner({
//     // required int currentLicense,
//     required T requiredLicense,
//     required bool isLicensed,
//     required Widget child,
//     ValueSetter<T>? onBannerTap,
//     Color? bannerColor,
//   }) {
//     return WithLicense(
//       // currentLicense: currentLicense,
//       requiredLicense: requiredLicense,
//       isLicensed: isLicensed,
//       child: child,
//       onBannerTap: onBannerTap,
//       withBanner: true,
//       bannerColor: bannerColor,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLicensed) {
//       return child;
//     } else if (withBanner == true) {
//       if (onBannerTap == null) {
//         return ClipRect(
//           child: AbsorbPointer(
//             child: Stack(children: [
//               child,
//               Banner(
//                 message: describeEnum(requiredLicense as dynamic),
//                 location: BannerLocation.topStart,
//                 color: _bannerColor,
//               ),
//             ]),
//           ),
//         );
//       } else {
//         return ClipRect(
//           child: InkWell(
//             onTap: () => onBannerTap!(requiredLicense),
//             child: AbsorbPointer(
//               child: Stack(children: [
//                 child,
//                 Banner(
//                   message: describeEnum(requiredLicense as dynamic),
//                   location: BannerLocation.topStart,
//                 ),
//               ]),
//             ),
//           ),
//         );
//       }
//     } else {
//       return SizedBox.shrink();
//     }
//   }
// }

// // class LicensedWidget2<T> extends StatelessWidget {
// //   late final LicenseController<T> _licenseController;
// //   final T? license;
// //   final Widget widget;
// //   final bool withBanner;

// //   LicensedWidget2({
// //     Key? key,
// //     LicenseController<T>? licenseController,
// //     this.license,
// //     required this.widget,
// //     this.withBanner = false,
// //   }) : super(key: key) {
// //     _licenseController = licenseController == null ? LicenseController<T>() : licenseController;
// //   }

// //   factory LicensedWidget2.banner({
// //     required T license,
// //     required Widget content,
// //     LicenseController<T>? licenseController,
// //   }) {
// //     return LicensedWidget2(
// //       licenseController: licenseController,
// //       widget: content,
// //       withBanner: true,
// //     );
// //   }

// //   factory LicensedWidget2.always({required Widget content}) {
// //     return LicensedWidget2(
// //       widget: content,
// //       withBanner: true,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final requiredIndex = _licenseController.getLicenseIndex();
// //     final licenseIndex = license?.index ?? 0;

// //     if (requiredIndex <= licenseIndex) {
// //       return widget;
// //     } else if (withBanner == true) {
// //       return ClipRect(
// //         child: AbsorbPointer(
// //           child: Stack(children: [
// //             widget,
// //             Banner(
// //               message: describeEnum(license as dynamic),
// //               location: BannerLocation.topStart,
// //             ),
// //           ]),
// //         ),
// //       );
// //     } else {
// //       throw 'error';
// //     }
// //   }
// // }
