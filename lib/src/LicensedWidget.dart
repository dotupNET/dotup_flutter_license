// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '../../dotup_flutter_license.dart';
// import 'ILicensedWidget.dart';
// import 'LicenseDescriptor.dart';

// class LicensedWidget<TLicense, TFeature> extends StatelessWidget implements ILicensedWidget<TFeature> {
//   // final int currentLicense;
//   // late final LicenseDescriptor license;
//   // late final LicenseController<TLicense, TFeature> controller;
//   late final FeatureDescriptor<TFeature> feature;
//   final Widget child;
//   final bool withBanner;
//   // late final ValueSetter<LicenseDescriptor>? _onLicenseTap;
//   late final ValueSetter<FeatureDescriptor<TFeature>>? _onFeatureTap;
//   late final Color _bannerColor;
//   late final bool isLicensed;

//   LicensedWidget({
//     Key? key,
//     // TLicense? license,
//     required this.feature,
//     // LicenseController<TLicense, TFeature>? controller,
//     bool? isLicensed,
//     required this.child,
//     this.withBanner = false,
//     // ValueSetter<LicenseDescriptor>? onLicenseTap,
//     ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap,
//     Color? bannerColor,
//   }) : super(key: key) {
//     _bannerColor = bannerColor ?? Colors.red;

//     // if (license == null) {
//     //   final featureDescriptor = LicenseController.instance.getFeature(feature);
//     //   this.license = featureDescriptor!.license;
//     // } else {
//     //   this.license = license;
//     // }
//     // if (controller != null) {
//     //   this.controller = controller;
//     // }
//     // if (license != null) {
//     //   this.license = license;
//     // }

//     // if (onLicenseTap != null) {
//     //   _onLicenseTap = onLicenseTap;
//     // }

//     if (onFeatureTap != null) {
//       _onFeatureTap = onFeatureTap;
//     }

//     if (isLicensed != null) {
//       this.isLicensed = isLicensed;
//     }
//   }

//   factory LicensedWidget.banner({
//     // required int currentLicense,
//     TFeature? feature,
//     TLicense? license,
//     // LicenseController<TLicense, TFeature>? controller,
//     bool? isLicensed,
//     required Widget child,
//     ValueSetter<TLicense>? onBannerTap,
//     Color? bannerColor,
//   }) {
//     assert(feature is! FeatureDescriptor);

//     final f = LicenseController.instance.getFeature(feature) as FeatureDescriptor<TFeature>;

//     return LicensedWidget<TLicense, TFeature>(
//       feature: f,
//       // controller: controller,
//       // currentLicense: currentLicense,
//       // license: license,
//       isLicensed: isLicensed,
//       child: child,
//       // onBannerTap: onBannerTap,
//       withBanner: true,
//       bannerColor: bannerColor,
//     );
//   }

//   factory LicensedWidget.license({required Widget child, required LicenseDescriptor license}) {
//     final f = LicenseController.instance.getFeatureFromLicense(license) as FeatureDescriptor<TFeature>;
//     return LicensedWidget<TLicense, TFeature>(
//       feature: f,
//       child: child,
//       withBanner: false,
//     );
//   }

//   factory LicensedWidget.feature({required Widget child, required TFeature feature, required bool withBanner}) {
//     final f = LicenseController.instance.getFeature(feature) as FeatureDescriptor<TFeature>;
//     return LicensedWidget<TLicense, TFeature>(
//       feature: f,
//       child: child,
//       withBanner: withBanner,
//     );
//   }

//   factory LicensedWidget.hidden({TLicense? license, required Widget child, TFeature? feature}) {
//     final f = LicenseController.instance.getFeature(feature) as FeatureDescriptor<TFeature>;
//     return LicensedWidget(
//       // license: license,
//       feature: f,
//       child: child,
//       withBanner: false,
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     if (isLicensed) {
//       return child;
//     } else if (withBanner == true) {
//       if (_onFeatureTap == null) {
//         return ClipRect(
//           child: AbsorbPointer(
//             child: Stack(children: [
//               child,
//               Banner(
//                 message: feature.license.label,
//                 location: BannerLocation.topStart,
//                 color: _bannerColor,
//               ),
//             ]),
//           ),
//         );
//       } else {
//         return ClipRect(
//           child: InkWell(
//             onTap: () {
//               if (feature != null && _onFeatureTap != null) {
//                 _onFeatureTap!(feature);
//                 // } else if (_onLicenseTap != null) {
//                 //   _onLicenseTap!(license);
//               }
//             },
//             child: AbsorbPointer(
//               child: Stack(
//                 children: [
//                   child,
//                   Banner(
//                     message: feature.license.label,
//                     location: BannerLocation.topStart,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     } else {
//       return SizedBox.shrink();
//     }
//   }

//   // @override
//   // void initialize(
//   //     {required bool isLicensed,
//   //     ValueSetter<LicenseDescriptor>? onLicenseTap,
//   //     ValueSetter<FeatureDescriptor<TLicense, TFeature>>? onFeatureTap}) {
//   //   // TODO: implement initialize
//   // }

//   @override
//   void initialize({required bool isLicensed, ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap}) {
//     this.isLicensed = isLicensed;
//     this._onFeatureTap = onFeatureTap;
//     // this._onLicenseTap = onLicenseTap;
//   }

//   // @override
//   // void initialize<TLicense, TFeature>({
//   //   required bool isLicensed,
//   //   ValueSetter<LicenseDescriptor>? onLicenseTap,
//   //   ValueSetter<FeatureDescriptor>? onFeatureTap,
//   // }) {
//   //   this.isLicensed = isLicensed;
//   //   this._onFeatureTap = onFeatureTap ;
//   //   this._onLicenseTap = onLicenseTap;
//   // }
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
