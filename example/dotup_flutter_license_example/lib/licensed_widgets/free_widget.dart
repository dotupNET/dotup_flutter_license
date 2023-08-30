import 'package:flutter/material.dart';

class FreeWidget extends StatelessWidget {
  const FreeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Icons.dnd_forwardslash),
      label: Text('A Free Button'),
      onPressed: () => print('Free pressed'),
    );
  }
}
