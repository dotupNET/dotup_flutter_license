import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:dotup_flutter_license_example/LicenseType.dart';

enum CustomerFeatureKey {
  None,
  Free,
  Basic,
  Pro,
  Enterprise,
}

class FeatureConfiguration {
  late final FeatureDescriptor<CustomerFeatureKey> customerFeatures;

  FeatureDescriptor<CustomerFeatureKey> getDescriptor(CustomerFeatureKey key) => customerFeatures.findFeature(key);

  FeatureConfiguration() {
    customerFeatures = FeatureDescriptor<CustomerFeatureKey>(
      key: CustomerFeatureKey.None,
      license: AppLicense.None,
      name: 'Kunden',
      description: 'Stammdaten Kunden',
      features: [
        FeatureDescriptor(
          key: CustomerFeatureKey.Free,
          license: AppLicense.Free,
          name: 'Suche',
          description: 'Suchfeld in QuickBar ein- und ausblenden',
        ),
        FeatureDescriptor(
          key: CustomerFeatureKey.Basic,
          license: AppLicense.Basic,
          name: 'Schnelles hinzufügen',
          description: 'Suchfeld in QuickBar ein- und ausblenden',
        ),
        FeatureDescriptor(
          key: CustomerFeatureKey.Pro,
          license: AppLicense.Pro,
          name: 'Quickfilter',
          description: 'KOnfiguration des Quickfilter',
        ),
        FeatureDescriptor(
          key: CustomerFeatureKey.Enterprise,
          license: AppLicense.Enterprise,
          name: 'Filter',
          description: 'Filter im Listenheader',
        ),
      ],
    );

    // final integrations = FeatureDescriptor<LicenseType>(
    //   name: 'Integration',
    //   description: 'Anbindung externe Systeme',
    //   features: [
    //     FeatureDescriptor(
    //       name: 'Azure',
    //       description: '?',
    //       license: LicenseType.Basic,
    //     ),
    //     FeatureDescriptor(
    //       name: 'Github',
    //       description: '?',
    //       license: LicenseType.Basic,
    //     ),
    //     FeatureDescriptor(
    //       name: 'Dolibarr',
    //       description: '?',
    //       license: LicenseType.Basic,
    //     ),
    //   ],
    // );
  }
}
