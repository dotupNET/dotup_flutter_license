import 'package:flutter/material.dart';


abstract class LateLicense<T>{
  T get license;
  void initialize(bool isLicensed);  
}

abstract class ILicensedWidget<T> {
  T getLicense();
  Widget get child;
  bool get withBanner;
  // int getLicenseIndex();

  // TModel getModel<TModel>();
}
// factory LicensedWidget.always({required Widget content}) {
