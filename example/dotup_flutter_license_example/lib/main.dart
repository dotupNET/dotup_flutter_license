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
            WithLicense(
                currentLicense: controller.currentLicense,
                requiredLicense: LicenseType.Pro,
                widget: Text('PRO FEATURE')),
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
                  widget: OutlinedButton(
                    child: Text("I'm visible with pro"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 10),
                LicensedWidget.banner(license: LicenseType.Free, content: NoLicenseWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(license: LicenseType.Basic, content: BasicWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(license: LicenseType.Pro, content: ProWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(license: LicenseType.Enterprise, content: EnterpriseWidget()),
                SizedBox(height: 10),
                LicensedWidget.banner(
                  license: LicenseType.Enterprise,
                  content: ListTile(
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
