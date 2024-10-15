import 'package:flutter/material.dart';

class TFollowingTextNumber extends StatelessWidget {
  const TFollowingTextNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("64", style: Theme.of(context).textTheme.bodyLarge,),
        Text("Followings", style: Theme.of(context).textTheme.bodySmall,),
      ],
    );
  }
}
