import 'package:flutter/material.dart';

import '../../dotup_flutter_license.dart';
import 'type_defs.dart';

class WithFeature<TFeature> extends StatelessWidget {
  late final FeatureDescriptor<TFeature> feature;
  final Widget child;
  late final ValueSetter<FeatureDescriptor<TFeature>>? _onFeatureTap;
  late final bool isLicensed;
  final bool withBanner;
  late final DecorationBuilder<FeatureDescriptor<TFeature>>? bannerDecorationBuilder;
  late final Decoration? notLicensedDecoration;

  WithFeature({
    Key? key,
    required TFeature feature,
    bool? isLicensed,
    required this.child,
    ValueSetter<FeatureDescriptor<TFeature>>? onFeatureTap,
    this.withBanner = false,
    this.bannerDecorationBuilder,
    this.notLicensedDecoration,
  }) : super(key: key) {
    final featureDescriptor = LicenseController.instance.getFeature(feature);
    this.feature = featureDescriptor as FeatureDescriptor<TFeature>;

    final controller = LicenseController.instance as LicenseController<dynamic, TFeature>;

    _onFeatureTap = onFeatureTap ?? controller.onFeatureTap;

    this.isLicensed = isLicensed ?? controller.isLicensed(this.feature.license);
  }

  factory WithFeature.banner({
    required TFeature feature,
    bool? isLicensed,
    required Widget child,
    ValueSetter<FeatureDescriptor<TFeature>>? onBannerTap,
    DecorationBuilder<FeatureDescriptor<TFeature>>? bannerDecorationBuilder,
    Decoration? notLicensedDecoration,
  }) {
    return WithFeature<TFeature>(
      feature: feature,
      isLicensed: isLicensed,
      child: child,
      withBanner: true,
      bannerDecorationBuilder: bannerDecorationBuilder,
      notLicensedDecoration: notLicensedDecoration,
    );
  }

  factory WithFeature.hidden({required TFeature feature, required Widget child}) {
    return WithFeature<TFeature>(
      feature: feature,
      child: child,
      withBanner: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLicensed) {
      return child;
    } else if (withBanner == true) {
      if (bannerDecorationBuilder != null) {
        return InkWell(
          onTap: () {
            if (_onFeatureTap != null) {
              _onFeatureTap!(feature);
            }
          },
          child: AbsorbPointer(
            child: Container(
              child: child,
              foregroundDecoration: bannerDecorationBuilder!(context, child, feature),
            ),
          ),
        );
      }

      if (_onFeatureTap == null) {
        return ClipRect(
          child: AbsorbPointer(
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  child: child,
                  foregroundDecoration: notLicensedDecoration,
                ),
                Banner(
                  message: feature.license.label,
                  location: BannerLocation.topStart,
                  color: feature.license.color,
                ),
              ],
            ),
          ),
        );
      } else {
        return ClipRect(
          child: InkWell(
            onTap: () {
              if (_onFeatureTap != null) {
                _onFeatureTap!(feature);
              }
            },
            child: AbsorbPointer(
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    child: child,
                    foregroundDecoration: notLicensedDecoration,
                  ),
                  Banner(
                    message: feature.license.label,
                    location: BannerLocation.topStart,
                    color: feature.license.color,
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
  // Widget build(BuildContext context) {
  //   if (isLicensed) {
  //     return child;
  //   } else if (withBanner == true) {
  //     if (_onFeatureTap == null) {
  //       return ClipRect(
  //         child: AbsorbPointer(
  //           child: Stack(children: [
  //             child,
  //             Banner(
  //               message: feature.license.label,
  //               location: BannerLocation.topStart,
  //               color: _bannerColor,
  //             ),
  //           ]),
  //         ),
  //       );
  //     } else {
  //       return ClipRect(
  //         child: InkWell(
  //           onTap: () {
  //             if (_onFeatureTap != null) {
  //               _onFeatureTap!(feature);
  //               // } else if (_onLicenseTap != null) {
  //               //   _onLicenseTap!(license);
  //             }
  //           },
  //           child: AbsorbPointer(
  //             child: Stack(
  //               children: [
  //                 child,
  //                 Banner(
  //                   message: feature.license.label,
  //                   location: BannerLocation.topStart,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   } else {
  //     return SizedBox.shrink();
  //   }
  // }
}
