import 'package:dotup_flutter_license/dotup_flutter_license.dart';
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
  late final LicenseController controller;

  @override
  void initState() {
    controller = LicenseController(widget._initialLicense);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WithLicense.banner(
              currentLicense: controller.currentLicense,
              requiredLicense: LicenseType.Pro,
              child: ListTile(title: Text('PRO FEATURE')),
            ),
            WithLicense(
              currentLicense: controller.currentLicense,
              requiredLicense: LicenseType.Enterprise,
              child: Text('ENTERPRISE FEATURE'),
            ),
            ListTile(
              title: Text('License'),
              trailing: DropdownButton<LicenseType>(
                value: controller.getLicense(),
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
            Licensed(
              licenseService: controller,
              onBannerTap: (license) => print('Banner tap $license'),
              // licenseService: MyLicenseService(licenseType),
              widgets: [
                OutlinedButton(
                  child: Text("I'm always visible 1"),
                  onPressed: () {},
                ),
                // LicensedWidget.always(
                //   content: OutlinedButton(
                //     child: Text("I'm always visible 2"),
                //     onPressed: () {},
                //   ),
                // ),
                SizedBox(height: 10),
                LicensedWidget(
                  requiredLicense: LicenseType.Pro,
                  child: OutlinedButton(
                    child: Text("I'm visible with pro"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 10),
                LicensedWidget.banner(requiredLicense: LicenseType.Free, child: NoLicenseWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(requiredLicense: LicenseType.Basic, child: BasicWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(requiredLicense: LicenseType.Pro, child: ProWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(requiredLicense: LicenseType.Enterprise, child: EnterpriseWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(
                  requiredLicense: LicenseType.Enterprise,
                  child: ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text('Only for enterprise'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _changeLicense(LicenseType? value) {
    setState(() {
      controller.setLicense(value);
    });
  }
}
