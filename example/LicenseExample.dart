import 'package:flutter/material.dart';

main(List<String> args) {
  licenseExample();
}

void licenseExample() {}

class LicenseExampleApp extends StatelessWidget {
  const LicenseExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'License example',
      home: Center(child: Text('OHA'),),
    );
  }
}
