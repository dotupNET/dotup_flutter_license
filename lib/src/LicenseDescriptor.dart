typedef LicenseList = List<LicenseDescriptor>;

class LicenseDescriptor<T> {
  final T key;
  final int index;
  final String label;
  LicenseDescriptor({required this.key, required this.index, required this.label});
  // LicenseDescriptor({required this.key, required this.index, required this.label});
}
