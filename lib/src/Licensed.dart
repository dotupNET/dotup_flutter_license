import 'package:dotup_flutter_license/src/LicenseController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'LicensedWidget.dart';

import 'IndexedExtensions.dart';

class Licensed<T> extends StatelessWidget {
  late final List<Widget> widgets;
  final LicenseController<T> licenseService;
  final ValueSetter<T>? onBannerTap;
  late final Color _bannerColor;

  Licensed({
    Key? key,
    required this.licenseService,
    required this.widgets,
    this.onBannerTap,
    Color? bannerColor,
  }) : super(key: key) {
    _bannerColor = bannerColor ?? Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childs = [];

    final currentLicense = licenseService.getLicenseIndex();

    for (var item in widgets) {
      if (item is LicensedWidget<T>) {
        final itemLicense = item.requiredLicense?.index ?? 9999;

        if (itemLicense <= currentLicense) {
          childs.add(item.child);
        } else if (item.withBanner == true) {
          if (onBannerTap == null) {
            childs.add(
              ClipRect(
                child: AbsorbPointer(
                  child: Stack(children: [
                    item.child,
                    Banner(
                      message: describeEnum(item.requiredLicense as dynamic),
                      location: BannerLocation.topStart,
                    ),
                  ]),
                ),
              ),
            );
          } else {
            childs.add(
              ClipRect(
                child: InkWell(
                  onTap: () => onBannerTap!(item.requiredLicense),
                  child: AbsorbPointer(
                    child: Stack(children: [
                      item.child,
                      Banner(
                        message: describeEnum(item.requiredLicense as dynamic),
                        location: BannerLocation.topStart,
                        color: _bannerColor,
                      ),
                    ]),
                  ),
                ),
              ),
            );
          }
        }
      } else {
        childs.add(item);
      }
    }

    // final widget = widgets.where((element) => element.license == licenseService.getLicense());

    // final banner = widgets.where((element) => element.withBanner == true);
    // if (widget != null) {
    //   return Banner(
    //     message: describeEnum(banner!.license as dynamic),
    //     location: BannerLocation.topStart,
    //     child: banner.content,
    //   );
    // }
    if (childs.isEmpty) {
      return Text('License "${licenseService.getLicense()}" not found.');
    } else {
      return Column(
        children: childs,
      );
    }
  }
}
