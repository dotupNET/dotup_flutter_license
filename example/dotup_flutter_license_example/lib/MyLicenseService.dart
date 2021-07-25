import 'package:dotup_flutter_license/dotup_flutter_license.dart';

import 'LicenseType.dart';

class MyLicenseService implements ILicenseService<LicenseType> {
  LicenseType licenseType;

  MyLicenseService(this.licenseType);

  @override
  LicenseType getLicense() {
    return licenseType;
  }
}
