import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  const BasicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Icons.dnd_forwardslash),
      label: Text('A Basic Button'),
      onPressed: () => print('Basic pressed'),
    );
  }
}
