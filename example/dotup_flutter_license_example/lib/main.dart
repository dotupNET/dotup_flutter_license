import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:dotup_flutter_license_example/AppLicenseController.dart';
import 'package:dotup_flutter_license_example/FeatureConfiguration.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/BasicWidget.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/EnterpriseWidget.dart';
import 'package:dotup_flutter_license_example/LicenseType.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/FreeWidget.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/ProWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import 'LicensedWidgets/NoLicenseWidget.dart';

void main() {
  runApp(LicenseExample());
}

final notLicensedDecoration = BoxDecoration(color: Colors.grey.shade800.withOpacity(0.6));

class LicenseExample extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dotup license example',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LicenseExampleScaffold(
        title: 'dotup license example',
      ),
    );
  }
}

class LicenseExampleScaffold extends StatefulWidget {
  LicenseExampleScaffold({
    Key? key,
    required this.title,
    LicenseDescriptor? initialLicense,
  }) : super(key: key) {
    _initialLicense = initialLicense ?? AppLicense.Free;
  }

  final String title;
  late final LicenseDescriptor _initialLicense;

  @override
  _LicenseExampleScaffoldState createState() => _LicenseExampleScaffoldState();
}

class _LicenseExampleScaffoldState extends State<LicenseExampleScaffold> {
  // late final LicenseController controller;
  // late final LicenseController<CustomerFeatureKey, LicenseType> LicenseController;
  late final FeatureConfiguration config;
  late final AppLicenseController controller;

  @override
  void initState() {
    config = FeatureConfiguration();
    controller = AppLicenseController.instance.configure(widget._initialLicense);
    // controller = LicenseController(widget._initialLicense);
    // LicenseController = LicenseController<CustomerFeatureKey, LicenseType>(widget._initialLicense);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('License'),
                trailing: DropdownButton<int>(
                  value: controller.getCurrentLicense().index,
                  onChanged: (value) => _changeLicense(value),
                  items: [
                    ...AppLicense.values.map(
                      (e) {
                        return DropdownMenuItem(child: Text(e.label), value: e.index);
                      },
                    ),
                  ],
                ),
              ),
              WithLicense(
                license: AppLicense.Basic,
                child: OutlinedButton(child: Text('TriangleDecoration license Basic'), onPressed: () {}),
                bannerDecorationBuilder: (context, child, license) {
                  return TriangleDecoration(
                    size: Size.square(20),
                    color: license.color,
                    textSpan: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 10.0, fontFamily: 'Roboto'),
                      text: 'B',
                    ),
                  );
                },
                notLicensedDecoration: notLicensedDecoration,
                withBanner: true,
                onLicenseTap: (license) => print(license),
              ),
              WithLicense(
                license: AppLicense.Pro,
                child: ListTile(
                  title: Text('TriangleDecoration Pro ListTile'),
                ),
                bannerDecorationBuilder: (context, child, license) {
                  return TriangleDecoration(
                    size: Size.square(30),
                    color: license.color,
                    textSpan: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: 'Roboto'),
                      text: 'P',
                    ),
                  );
                },
                withBanner: true,
              ),
              WithLicense(
                license: AppLicense.Pro,
                child: ListTile(
                  title: Text('Pro ListTile 22'),
                ),
                bannerDecorationBuilder: (context, child, license) {
                  return TriangleDecoration(
                    size: Size(24, 24),
                    color: license.color,
                    textSpan: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 11.0, fontFamily: 'Roboto'),
                      text: 'Pro',
                    ),
                  );
                },
                notLicensedDecoration: notLicensedDecoration,
                // decorationBuilder: (context, child, license) {
                //   // return ShapeDecoration(
                //   //   color: Colors.white,
                //   //   shape: Border.all(
                //   //     color: Colors.red,
                //   //     width: 8.0,
                //   //   ),
                //   // );
                //   // return RotatedCornerDecoration(
                //   //   badgeShadow: BadgeShadow(color: Colors.grey, elevation: 2),
                //   //   color: Colors.red,
                //   //   geometry:
                //   //       const BadgeGeometry(width: 30, height: 30, alignment: BadgeAlignment.topLeft, cornerRadius: 15),
                //   //   textSpan: TextSpan(
                //   //     text: license.label,
                //   //     style: TextStyle(fontSize: 10, color: Colors.white),
                //   //   ),
                //   // );
                // },
                // banner: Container(
                //   // padding: const EdgeInsets.all(12),
                //   child: ListTile(
                //     title: Text('Pro ListTile abc'),
                //   ),
                //   // alignment: Alignment.topRight,

                //   foregroundDecoration: const RotatedCornerDecoration(
                //     badgeShadow: BadgeShadow(color: Colors.grey, elevation: 2),
                //     color: Colors.red,
                //     geometry:
                //         const BadgeGeometry(width: 30, height: 30, alignment: BadgeAlignment.topLeft, cornerRadius: 0),
                //     textSpan: const TextSpan(
                //       text: 'Pro',
                //       style: TextStyle(fontSize: 10, color: Colors.white),
                //     ),
                //   ),
                // ),
                withBanner: true,
              ),
              ..._getLicenseWidgets(),
              SizedBox(height: 10),
              ..._getFeatureWidgets(),
              SizedBox(height: 10),
              WithFeature.banner(
                feature: CustomerFeatureKey.Pro,
                child: ListTile(
                  title: Text('TriangleDecoration Pro Feature'),
                ),
                bannerDecorationBuilder: (context, child, item) {
                  return TriangleDecoration(
                    size: Size.square(30),
                    color: item.license.color,
                    textSpan: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: 'Roboto'),
                      text: 'P',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _changeLicense(int? index) {
    setState(() {
      controller.setLicense(AppLicense.getDescriptor(index));
    });
  }

  List<Widget> _getLicenseWidgets() {
    return [
      WithLicense.banner(
        license: AppLicense.None,
        child: NoLicenseWidget(),
        notLicensedDecoration: notLicensedDecoration,
      ),
      SizedBox(height: 10),
      WithLicense.banner(
        license: AppLicense.Free,
        child: FreeWidget(),
        notLicensedDecoration: notLicensedDecoration,
      ),
      SizedBox(height: 10),
      WithLicense.banner(
        license: AppLicense.Basic,
        child: BasicWidget(),
        notLicensedDecoration: notLicensedDecoration,
      ),
      SizedBox(height: 10),
      WithLicense.banner(
        license: AppLicense.Pro,
        child: ProWidget(),
        notLicensedDecoration: notLicensedDecoration,
      ),
      SizedBox(height: 10),
      WithLicense.banner(
        license: AppLicense.Enterprise,
        child: EnterpriseWidget(),
        notLicensedDecoration: notLicensedDecoration,
      ),
    ];
  }

  _getFeatureWidgets() {
    return [
      Text('With features'),
      SizedBox(height: 10),
      WithFeature.banner(feature: CustomerFeatureKey.None, child: NoLicenseWidget()),
      SizedBox(height: 10),
      WithFeature.banner(feature: CustomerFeatureKey.Free, child: FreeWidget()),
      SizedBox(height: 10),
      WithFeature.banner(feature: CustomerFeatureKey.Basic, child: BasicWidget()),
      SizedBox(height: 10),
      WithFeature.banner(feature: CustomerFeatureKey.Pro, child: ProWidget()),
      SizedBox(height: 10),
      WithFeature.banner(feature: CustomerFeatureKey.Enterprise, child: EnterpriseWidget()),
      SizedBox(height: 10),
    ];
  }
}
