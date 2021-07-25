import 'IndexedExtensions.dart';

class LicenseController<T> {
  T? currentLicense;

  LicenseController([this.currentLicense]);

  // static LicenseController<T>? current;

  void setLicense(T value) {
    currentLicense = value;
  }

  T? getLicense() {
    return currentLicense;
  }

  int getLicenseIndex() {
    return currentLicense.index;
  }
}
