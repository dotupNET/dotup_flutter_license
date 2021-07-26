// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class ParentWidget<T> extends StatelessWidget {
//   final T model;
//   final Widget child;
//   final bool withBanner;
//   const ParentWidget({
//     Key? key,
//     required this.model,
//     required this.child,
//     this.withBanner = false,
//   }) : super(key: key);

//   factory ParentWidget.banner({required T model, required Widget child}) {
//     return ParentWidget(
//       model: model,
//       child: child,
//       withBanner: true,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return child;
//   }
// }
