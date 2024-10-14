import 'package:flutter/material.dart';

class TPostTextNumber extends StatelessWidget {
  const TPostTextNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("100", style: Theme.of(context).textTheme.bodyLarge,),
        Text("Posts", style: Theme.of(context).textTheme.bodySmall,),
      ],
    );
  }
}
