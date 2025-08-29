import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartMedDivider extends StatelessWidget {
  const SmartMedDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 60,
    );
  }
}