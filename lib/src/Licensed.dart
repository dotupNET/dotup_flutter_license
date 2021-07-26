import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ILicensedWidget.dart';

class Licensed<T> extends StatelessWidget {
  late final List<Widget> widgets;
  late final LicenseController controller;
  // final LicenseValidator licenseService;
  final ValueSetter<T>? onBannerTap;
  late final Color _bannerColor;

  Licensed({
    Key? key,
    required this.controller,
    required this.widgets,
    this.onBannerTap,
    Color? bannerColor,
  }) : super(key: key) {
    _bannerColor = bannerColor ?? Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childs = [];

    for (var widget in widgets) {
      if (widget is LateLicense) {
        (widget as LateLicense).initialize(controller.isLicensed(widget));
      
      }
      if (widget is ILicensedWidget) {
        final item = widget as ILicensedWidget;
        final isLicensed = controller.isLicensed(item);
        final w = WithLicense(
          license: item.getLicense(),
          isLicensed: isLicensed,
          child: item.child,
          withBanner: item.withBanner,
          
        );
        childs.add(w);
      }
    }

    // for (var widget in widgets) {
    //   if (widget is ILicensedWidget) {
    //     final item = widget as ILicensedWidget;
    //     if (LicenseController.instance.isLicensed(item)) {
    //       childs.add(item.child);
    //     } else if (item.withBanner == true) {
    //       if (onBannerTap == null) {
    //         childs.add(
    //           ClipRect(
    //             child: AbsorbPointer(
    //               child: Stack(children: [
    //                 item.child,
    //                 Banner(
    //                   message: describeEnum(item.getLicense() as dynamic),
    //                   location: BannerLocation.topStart,
    //                 ),
    //               ]),
    //             ),
    //           ),
    //         );
    //       } else {
    //         childs.add(
    //           ClipRect(
    //             child: InkWell(
    //               onTap: () => onBannerTap!(item.getModel()),
    //               child: AbsorbPointer(
    //                 child: Stack(children: [
    //                   item.child,
    //                   Banner(
    //                     message: describeEnum(item.getLicense() as dynamic),
    //                     location: BannerLocation.topStart,
    //                     color: _bannerColor,
    //                   ),
    //                 ]),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //     }
    //   } else {
    //     childs.add(widget);
    //   }
    // }

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
      return Text('License "${LicenseController.instance.getCurrentLicense()}" not found.');
    } else {
      return Column(
        children: childs,
      );
    }
  }
}
