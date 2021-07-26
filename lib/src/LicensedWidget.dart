import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ILicensedWidget.dart';

class LicensedWidget<TLicense, TFeature> extends StatelessWidget implements ILicensedWidget<TLicense> {
  final TLicense license;
   final FeatureDescriptor<TLicense, TFeature>? feature;
  final Widget child;
  final bool withBanner;


   LicensedWidget({
    Key? key,
    required this.license,
    this.feature,
    required this.child,
    this.withBanner = false,

  }) : super(key: key);

  factory LicensedWidget.hidden({TLicense? license, required Widget child, TFeature? feature}) {
    final f = LicenseController.instance.getFeature(feature) as FeatureDescriptor<TLicense, TFeature>;
    return LicensedWidget(
      license: license ?? f.license,
      feature: f,
      child: child,
      withBanner: false,
    );
  }

  factory LicensedWidget.banner({TLicense? license, required Widget child, TFeature? feature}) {
    final f = LicenseController.instance.getFeature(feature) as FeatureDescriptor<TLicense, TFeature>;
    return LicensedWidget(
      license: license ?? f.license,
      feature: f,
      child: child,
      withBanner: true,
    );
  }

  factory LicensedWidget.feature({required Widget child, required TFeature feature}) {
    final f = LicenseController.instance.getFeature(feature) as FeatureDescriptor<TLicense, TFeature>;
    return LicensedWidget(
      license: f.license,
      feature: f,
      child: child,
      withBanner: true,
    );
  }

  TLicense getLicense() {
    return license;
  }

//  @override
//   Widget build(BuildContext context) {
//     if (isLicensed) {
//       return child;
//     } else if (withBanner == true) {
//       if (onLicenseTap == null && onFeatureTap == null) {
//         return ClipRect(
//           child: AbsorbPointer(
//             child: Stack(children: [
//               child,
//               Banner(
//                 message: describeEnum(license as dynamic),
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
//               if (feature != null && onFeatureTap != null) {
//                 onFeatureTap!(feature!);
//               } else if (onLicenseTap != null) {
//                 onLicenseTap!(license);
//               }
//             },
//             child: AbsorbPointer(
//               child: Stack(
//                 children: [
//                   child,
//                   Banner(
//                     message: describeEnum(license as dynamic),
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


  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  int getLicenseIndex() {
    return (license as dynamic).index;
  }

}
