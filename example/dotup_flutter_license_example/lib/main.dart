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

import 'LicensedWidgets/NoLicenseWidget.dart';

void main() {
  runApp(LicenseExample());
}

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
              WithLicense.banner(
                license: AppLicense.None,
                child: NoLicenseWidget(),
              ),
              SizedBox(height: 10),
              WithLicense.banner(
                license: AppLicense.Free,
                child: FreeWidget(),
              ),
              SizedBox(height: 10),
              WithLicense.banner(
                license: AppLicense.Basic,
                child: BasicWidget(),
              ),
              SizedBox(height: 10),
              WithLicense.banner(
                license: AppLicense.Pro,
                child: ProWidget(),
              ),
              SizedBox(height: 10),
              WithLicense.banner(
                license: AppLicense.Enterprise,
                child: EnterpriseWidget(),
              ),
              SizedBox(height: 10),
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
}
