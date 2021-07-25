import 'package:dotup_flutter_license/src/LicenseController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'LicensedWidget.dart';

import 'IndexedExtensions.dart';

class Licensed<T> extends StatelessWidget {
  late final List<Widget> widgets;
  final LicenseController<T> licenseService;

  Licensed({
    Key? key,
    required this.licenseService,
    required this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childs = [];

    final currentLicense = licenseService.getLicenseIndex();

    for (var item in widgets) {
      if (item is LicensedWidget<T>) {
        final itemLicense = item.requiredLicense?.index ?? 9999;
        if (itemLicense <= currentLicense) {
          childs.add(item.widget);
        } else if (item.withBanner == true) {
          childs.add(
            ClipRect(
              child: AbsorbPointer(
                child: Stack(children: [
                  item.widget,
                  Banner(
                    message: describeEnum(item.requiredLicense as dynamic),
                    location: BannerLocation.topStart,
                  ),
                ]),
              ),
            ),
          );
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
