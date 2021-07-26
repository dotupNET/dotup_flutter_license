import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:dotup_flutter_license_example/FeatureConfiguration.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/BasicWidget.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/EnterpriseWidget.dart';
import 'package:dotup_flutter_license_example/LicenseType.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/FreeWidget.dart';
import 'package:dotup_flutter_license_example/LicensedWidgets/ProWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    LicenseType? initialLicense,
  }) : super(key: key) {
    _initialLicense = initialLicense ?? LicenseType.Free;
  }

  final String title;
  late final LicenseType _initialLicense;

  @override
  _LicenseExampleScaffoldState createState() => _LicenseExampleScaffoldState();
}

class _LicenseExampleScaffoldState extends State<LicenseExampleScaffold> {
  // late final LicenseController controller;
  // late final LicenseController<CustomerFeatureKey, LicenseType> LicenseController;
  late final FeatureConfiguration config;

  @override
  void initState() {
    config = FeatureConfiguration();
    LicenseController.instance.initialize(widget._initialLicense, config.customerFeatures);
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
              // WithLicense.banner(
              //   currentLicense: controller.currentLicense,
              //   requiredLicense: LicenseType.Pro,
              //   child: ListTile(title: Text('PRO FEATURE')),
              // ),
              // WithLicense(
              //   currentLicense: controller.currentLicense,
              //   requiredLicense: LicenseType.Enterprise,
              //   child: Text('ENTERPRISE FEATURE'),
              // ),
              ListTile(
                title: Text('License'),
                trailing: DropdownButton<LicenseType>(
                  value: LicenseController.instance.getCurrentLicense(),
                  onChanged: (value) => _changeLicense(value),
                  items: [
                    ...LicenseType.values.map(
                      (e) {
                        return DropdownMenuItem(child: Text(describeEnum(e)), value: e);
                      },
                    ),
                  ],
                ),
              ),
              WithLicense.banner(license: LicenseType.Pro, isLicensed: false, child: ProWidget()),
              // WithLicense.banner(feature: CustomerFeatureKey.DashboardPage, child: BasicWidget()),
              // WithLicense.banner(
              //     requiredLicense: LicenseType.Pro,
              //     currentLicense: LicenseController.instance.getCurrentLicense(),
              //     child: ProWidget()),
              // Licensed<LicenseType>(
              //   licenseService: controller,
              //   onBannerTap: (license) => print('Banner tap $license'),
              //   // licenseService: MyLicenseService(licenseType),
              //   widgets: [
              //     OutlinedButton(
              //       child: Text("I'm always visible 1"),
              //       onPressed: () {},
              //     ),
              //     // LicensedWidget.always(
              //     //   content: OutlinedButton(
              //     //     child: Text("I'm always visible 2"),
              //     //     onPressed: () {},
              //     //   ),
              //     // ),
              //     SizedBox(height: 10),
              //     LicensedWidget(
              //       model: LicenseType.Pro,
              //       child: OutlinedButton(
              //         child: Text("I'm visible with pro"),
              //         onPressed: () {},
              //       ),
              //     ),
              //     SizedBox(height: 10),
              //     LicensedWidget.banner(model: LicenseType.Free, child: NoLicenseWidget()),
              //     SizedBox(height: 10),
              //     LicensedWidget.banner(model: LicenseType.Basic, child: BasicWidget()),
              //     SizedBox(height: 10),
              //     LicensedWidget.banner(model: LicenseType.Pro, child: ProWidget()),
              //     SizedBox(height: 10),
              //     LicensedWidget.banner(model: LicenseType.Enterprise, child: EnterpriseWidget()),
              //     SizedBox(height: 10),
              //     LicensedWidget.banner(
              //       model: LicenseType.Enterprise,
              //       child: ListTile(
              //         leading: Icon(Icons.alarm),
              //         title: Text('Only for enterprise'),
              //       ),
              //     ),
              //   ],
              // ),
              Licensed<FeatureDescriptor<CustomerFeatureKey, LicenseType>>(
                controller: LicenseController.instance,
                // licenseService: LicenseController,
                onBannerTap: (license) => print('LicensedFeature Banner tap $license'),
                // licenseService: MyLicenseService(licenseType),
                widgets: [
                  OutlinedButton(
                    child: Text("LicensedFeature I'm always visible 1"),
                    onPressed: () {},
                  ),
                  // LicensedWidget.always(
                  //   content: OutlinedButton(
                  //     child: Text("I'm always visible 2"),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  LicensedWidget.banner(
                    // feature: config.customerFeatures.findFeature(CustomerFeatureKey.DashboardPage),
                    feature: CustomerFeatureKey.DashboardPage,
                    child: OutlinedButton(
                      child: Text("LicensedFeature Feature from config with find"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 10),
                  LicensedWidget.feature(
                    feature: CustomerFeatureKey.DashboardPage, // CustomerFeatureKey.DashboardPage),
                    child: OutlinedButton(
                      child: Text("LicensedFeature I'm visible with pro"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 10),
                  LicensedWidget.banner(
                    feature: CustomerFeatureKey.Integration,
                    child: ProWidget(),
                  ),
                  SizedBox(height: 10),
                  LicensedWidget.banner(feature: CustomerFeatureKey.DashboardPage, child: BasicWidget()),
                  SizedBox(height: 10),
                  LicensedWidget.banner(feature: CustomerFeatureKey.ListPage_QuickBar, child: ProWidget()),
                  SizedBox(height: 10),
                  LicensedWidget.banner(feature: CustomerFeatureKey.DashboardPage, child: EnterpriseWidget()),
                  SizedBox(height: 10),
                  LicensedWidget.banner(
                    feature: CustomerFeatureKey.DashboardPage,
                    child: ListTile(
                      leading: Icon(Icons.alarm),
                      title: Text('LicensedFeature Only for enterprise'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _changeLicense(LicenseType? value) {
    setState(() {
      LicenseController.instance.setLicense(value!);
    });
  }
}
