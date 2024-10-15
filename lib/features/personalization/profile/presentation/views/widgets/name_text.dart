import 'package:flutter/material.dart';

class TNameText extends StatelessWidget {
  const TNameText({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name, style: Theme.of(context).textTheme.headlineMedium);
  }
}
