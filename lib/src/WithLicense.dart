import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../dotup_flutter_license.dart';
import 'LicenseDescriptor.dart';
import 'TypeDefs.dart';

class WithLicense<TLicense> extends StatelessWidget {
  late final LicenseDescriptor<TLicense> license;
  final Widget child;
  late final ValueSetter<LicenseDescriptor<TLicense>>? _onLicenseTap;
  late final bool isLicensed;
  final bool withBanner;
  late final DecorationBuilder<LicenseDescriptor<TLicense>>? bannerDecorationBuilder;
  late final Decoration? notLicensedDecoration;

  WithLicense({
    Key? key,
    required this.license,
    bool? isLicensed,
    required this.child,
    ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap,
    this.withBanner = false,
    this.bannerDecorationBuilder,
    this.notLicensedDecoration,
  }) : super(key: key) {
    final controller = LicenseController.instance as LicenseController<TLicense, dynamic>;

    _onLicenseTap = onLicenseTap ?? controller.onLicenseTap;

    this.isLicensed = isLicensed ?? controller.isLicensed(this.license);
  }

  factory WithLicense.banner({
    required LicenseDescriptor<TLicense> license,
    bool? isLicensed,
    required Widget child,
    ValueSetter<LicenseDescriptor<TLicense>>? onLicenseTap,
    DecorationBuilder<LicenseDescriptor<TLicense>>? bannerDecorationBuilder,
    Decoration? notLicensedDecoration,
  }) {
    return WithLicense<TLicense>(
      license: license,
      isLicensed: isLicensed,
      child: child,
      onLicenseTap: onLicenseTap,
      withBanner: true,
      bannerDecorationBuilder: bannerDecorationBuilder,
      notLicensedDecoration: notLicensedDecoration,
    );
  }

  factory WithLicense.hidden({required LicenseDescriptor<TLicense> license, required Widget child}) {
    return WithLicense<TLicense>(
      license: license,
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
            if (_onLicenseTap != null) {
              _onLicenseTap!(license);
            }
          },
          child: AbsorbPointer(
            child: Container(
              child: Container(
                child: child,
                foregroundDecoration: notLicensedDecoration,
              ),
              foregroundDecoration: bannerDecorationBuilder!(context, child, license),
            ),
          ),
        );
      }

      if (_onLicenseTap == null) {
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
                  message: license.label,
                  location: BannerLocation.topStart,
                  color: license.color,
                ),
              ],
            ),
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
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    child: child,
                    foregroundDecoration: notLicensedDecoration,
                  ),
                  Banner(
                    message: license.label,
                    location: BannerLocation.topStart,
                    color: license.color,
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
