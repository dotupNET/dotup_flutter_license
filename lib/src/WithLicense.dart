import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dotup_flutter_license.dart';
import 'LicenseDescriptor.dart';

class WithLicense<TLicense> extends StatelessWidget {
  late final LicenseDescriptor<TLicense> license;
  final Widget child;
  final bool withBanner;
  late final ValueSetter<LicenseDescriptor<TLicense>>? _onLicenseTap;
  late final Color _bannerColor;
  late final bool isLicensed;

  WithLicense({
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

  factory WithLicense.banner({
    required LicenseDescriptor<TLicense> license,
    bool? isLicensed,
    required Widget child,
    ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap,
    Color? bannerColor,
  }) {
    return WithLicense<TLicense>(
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

  factory WithLicense.hidden({required LicenseDescriptor<TLicense> license, required Widget child}) {
    return WithLicense<TLicense>(
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
}
