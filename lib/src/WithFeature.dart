import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dotup_flutter_license.dart';

class WithFeature<TFeature> extends StatelessWidget {
  late final FeatureDescriptor<TFeature> feature;
  final Widget child;
  final bool withBanner;
  late final ValueSetter<FeatureDescriptor<TFeature>>? _onFeatureTap;
  late final Color _bannerColor;
  late final bool isLicensed;

  WithFeature({
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

    final controller = LicenseController.instance as LicenseController<dynamic, TFeature>;

    _onFeatureTap = onFeatureTap ?? controller.onFeatureTap;

    this.isLicensed = isLicensed ?? controller.isLicensed(this.feature.license);
  }

  factory WithFeature.banner({
    required TFeature feature,
    bool? isLicensed,
    required Widget child,
    ValueSetter<FeatureDescriptor<TFeature>>? onBannerTap,
    Color? bannerColor,
  }) {
    return WithFeature<TFeature>(
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

  factory WithFeature.hidden({required TFeature feature, required Widget child}) {
    return WithFeature<TFeature>(
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
}
