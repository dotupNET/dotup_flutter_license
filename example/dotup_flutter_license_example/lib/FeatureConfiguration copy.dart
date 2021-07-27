// import 'package:dotup_flutter_license/dotup_flutter_license.dart';
// import 'package:dotup_flutter_license_example/LicenseType.dart';

// enum CustomerFeatureKey {
//   None,
//   Module,
//   DashboardPage,
//   ListPage,
//   ListPage_QuickBar,
//   ListPage_QuickBar_Search,
//   ListPage_QuickBar_Add,
//   ListPage_QuickBar_Filter,
//   ListPage_Filter,
//   Settings,
//   Settings_StartPage,
//   Integration,
//   Integration_Import,
//   Integration_Export,
//   Integration_Azure,
//   Integration_Azure_read,
//   Integration_Azure_write,
//   Integration_Azure_sync,
//   Integration_Github_read,
//   Integration_Github,
//   Integration_Github_write,
//   Integration_Github_sync,
//   Integration_Zeitick,
//   Integration_Zeitick_read,
//   Integration_Zeitick_write,
//   Integration_Zeitick_sync,
//   Integration_Dolibarr,
//   Integration_Dolibarr_read,
//   Integration_Dolibarr_write,
//   Integration_Dolibarr_sync,
// }

// class FeatureConfiguration {
//   late final FeatureDescriptor<CustomerFeatureKey> customerFeatures;

//   FeatureDescriptor< CustomerFeatureKey> getDescriptor(CustomerFeatureKey key) =>
//       customerFeatures.findFeature(key);

//   FeatureConfiguration() {
//     customerFeatures = FeatureDescriptor< CustomerFeatureKey>(
//       key: CustomerFeatureKey.Module,
//       license: AppLicense.None,
//       name: 'Kunden',
//       description: 'Stammdaten Kunden',
//       features: [
//         FeatureDescriptor(
//           key: CustomerFeatureKey.DashboardPage,
//           license: AppLicense.Pro,
//           name: 'Übersicht',
//           description: '?',
//         ),
//         FeatureDescriptor(
//           key: CustomerFeatureKey.ListPage,
//           license: AppLicense.Basic,
//           name: 'Kundenliste',
//           description: '?',
//           features: [
//             FeatureDescriptor(
//               key: CustomerFeatureKey.ListPage_QuickBar,
//               license: AppLicense.Basic,
//               name: 'QuickBar',
//               description: 'Schnellzugriff auf diverse Funktionalitäten',
//               features: [
//                 FeatureDescriptor(
//                   key: CustomerFeatureKey.ListPage_QuickBar_Search,
//                   license: AppLicense.Basic,
//                   name: 'Suche',
//                   description: 'Suchfeld in QuickBar ein- und ausblenden',
//                 ),
//                 FeatureDescriptor(
//                   key: CustomerFeatureKey.ListPage_QuickBar_Add,
//                   license: AppLicense.Basic,
//                   name: 'Schnelles hinzufügen',
//                   description: 'Suchfeld in QuickBar ein- und ausblenden',
//                 ),
//                 FeatureDescriptor(
//                   key: CustomerFeatureKey.ListPage_QuickBar_Filter,
//                   license: AppLicense.Basic,
//                   name: 'Quickfilter',
//                   description: 'KOnfiguration des Quickfilter',
//                 ),
//                 FeatureDescriptor(
//                   key: CustomerFeatureKey.ListPage_Filter,
//                   license: AppLicense.Basic,
//                   name: 'Filter',
//                   description: 'Filter im Listenheader',
//                 ),
//               ],
//             ),
//           ],
//         ),
//         FeatureDescriptor(
//           key: CustomerFeatureKey.Settings,
//           license: AppLicense.Basic,
//           name: 'Einstellungen',
//           description: '?',
//           features: [
//             FeatureDescriptor(
//               key: CustomerFeatureKey.Settings_StartPage,
//               license: AppLicense.Basic,
//               name: 'Startseite',
//               description: 'Konfiguration der Startseite',
//             ),
//           ],
//         ),
//         FeatureDescriptor(
//           key: CustomerFeatureKey.Integration,
//           license: AppLicense.Pro,
//           name: 'Integration',
//           description: 'Synchronisation externer Systeme',
//           features: [
//             FeatureDescriptor(
//               key: CustomerFeatureKey.Integration_Azure,
//               license: AppLicense.Basic,
//               name: 'Azure',
//               description: 'Anbindung an Azure DevOps',
//             ),
//             FeatureDescriptor(
//               key: CustomerFeatureKey.Integration_Dolibarr,
//               license: AppLicense.Basic,
//               name: 'Dolibarr',
//               description: 'Anbindung an Dolibarr',
//             ),
//             FeatureDescriptor(
//               key: CustomerFeatureKey.Integration_Export,
//               license: AppLicense.Basic,
//               name: 'Import/Export',
//               description: 'Import und Export im CSV Format',
//             ),
//             FeatureDescriptor(
//               key: CustomerFeatureKey.Integration_Github,
//               license: AppLicense.Basic,
//               name: 'Github',
//               description: 'Anbindung an Github',
//             ),
//             FeatureDescriptor(
//               key: CustomerFeatureKey.Integration_Zeitick,
//               license: AppLicense.Basic,
//               name: 'zeiTick',
//               description: 'Anbindung an zeiTick',
//             ),
//           ],
//         ),
//       ],
//     );

//     // final integrations = FeatureDescriptor<LicenseType>(
//     //   name: 'Integration',
//     //   description: 'Anbindung externe Systeme',
//     //   features: [
//     //     FeatureDescriptor(
//     //       name: 'Azure',
//     //       description: '?',
//     //       license: LicenseType.Basic,
//     //     ),
//     //     FeatureDescriptor(
//     //       name: 'Github',
//     //       description: '?',
//     //       license: LicenseType.Basic,
//     //     ),
//     //     FeatureDescriptor(
//     //       name: 'Dolibarr',
//     //       description: '?',
//     //       license: LicenseType.Basic,
//     //     ),
//     //   ],
//     // );
//   }
// }
