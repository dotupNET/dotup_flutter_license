import 'package:dotup_flutter_license/dotup_flutter_license.dart';
import 'package:dotup_flutter_extensions/dotup_flutter_extensions.dart';

class FeatureDescriptor<TFeature> {
  final TFeature key;
  final LicenseDescriptor license;
  final String name;
  final String description;
  late final List<FeatureDescriptor<TFeature>> features;

  FeatureDescriptor({
    required this.key,
    required this.license,
    required this.name,
    required this.description,
    List<FeatureDescriptor<TFeature>>? features,
  }) {
    this.features = features ?? [];
  }

  FeatureDescriptor<TFeature> findFeature(TFeature key) {
    if (this.key == key) {
      return this;
    }

    FeatureDescriptor<TFeature>? find(TFeature key, List<FeatureDescriptor<TFeature>> featuresList) {
      var result = featuresList.firstWhereOrNull((element) => element.key == key);

      if (result == null) {
        for (var item in featuresList) {
          result = find(key, item.features);
          if (result != null) {
            return result;
          }
        }
      }
      return result;
    }

    final item = find(key, features);
    if (item == null) {
      throw 'License not found';
    }
    return item;
  }
}
// class FeatureDescriptor<T> {
//   final String name;
//   final String description;
//   final T license;
//   late final List<FeatureDescriptor<T>> subFeatures;

//   FeatureDescriptor({
//     required this.name,
//     required this.description,
//     required this.license,
//     List<FeatureDescriptor<T>>? subFeatures,
//   }) {
//     this.subFeatures = subFeatures ?? [];
//   }
// }
