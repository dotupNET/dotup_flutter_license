import 'package:flutter/material.dart';

class EnterpriseWidget extends StatelessWidget {
  const EnterpriseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Icons.dnd_forwardslash),
      label: Text('A Enterprise Button'),
      onPressed: () => print('Enterprise pressed'),
    );
  }
}
