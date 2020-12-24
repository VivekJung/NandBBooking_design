import 'package:flutter/material.dart';

class IconBuilder extends StatelessWidget {
  final IconData iconData;
  final String label;

  IconBuilder({@required this.iconData, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: [
          Icon(iconData),
          Text(label),
        ],
      ),
    );
  }
}
