// import 'package:dotup_flutter_license/src/LicenseController.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'LicensedWidget.dart';

// import 'IndexedExtensions.dart';
// import 'LicensedWidget2.dart';

// class Licensed2<T> extends StatelessWidget {
//   late final List<Widget> widgets;
//   final LicenseController<T> licenseService;

//   Licensed2({
//     Key? key,
//     required this.licenseService,
//     required this.widgets,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> childs = [];

//     final currentLicense = licenseService.getLicenseIndex();

//     for (var item in widgets) {
//       if (item is LicensedWidget2<T>) {
//         childs.add(item);
//       } else {
//         childs.add(item);
//       }
//     }

//     if (childs.isEmpty) {
//       return Text('License "${licenseService.getLicense()}" not found.');
//     } else {
//       return Column(
//         children: childs,
//       );
//     }
//   }

// }
