import 'package:flutter/material.dart';

class ProWidget extends StatelessWidget {
  const ProWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Icons.dnd_forwardslash),
      label: Text('A Pro Button'),
      onPressed: () => print('Pro pressed'),
    );
  }
}
