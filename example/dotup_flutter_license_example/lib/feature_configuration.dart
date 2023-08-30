import 'package:dotup_flutter_license/dotup_flutter_license.dart';

import 'license_type.dart';

enum FeatureKey {
  None,
  Free,
  Basic,
  Pro,
  Enterprise,
}

class FeatureConfiguration {
  late final FeatureDescriptor<FeatureKey> features;

  FeatureDescriptor<FeatureKey> getDescriptor(FeatureKey key) => features.findFeature(key);

  FeatureConfiguration() {
    features = FeatureDescriptor<FeatureKey>(
      key: FeatureKey.None,
      license: AppLicense.None,
      name: 'Kunden',
      description: 'Stammdaten Kunden',
      features: [
        FeatureDescriptor(
          key: FeatureKey.Free,
          license: AppLicense.Free,
          name: 'Suche',
          description: 'Suchfeld in QuickBar ein- und ausblenden',
        ),
        FeatureDescriptor(
          key: FeatureKey.Basic,
          license: AppLicense.Basic,
          name: 'Schnelles hinzufügen',
          description: 'Suchfeld in QuickBar ein- und ausblenden',
        ),
        FeatureDescriptor(
          key: FeatureKey.Pro,
          license: AppLicense.Pro,
          name: 'Quickfilter',
          description: 'KOnfiguration des Quickfilter',
        ),
        FeatureDescriptor(
          key: FeatureKey.Enterprise,
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
