import 'package:flutter/material.dart';

class TFollowerTextNumber extends StatelessWidget {
  const TFollowerTextNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("10k", style: Theme.of(context).textTheme.bodyLarge,),
        Text("Followers", style: Theme.of(context).textTheme.bodySmall,),
      ],
    );
  }
}
