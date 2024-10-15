import 'package:flutter/material.dart';

class TPhotoTextNumber extends StatelessWidget {
  const TPhotoTextNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("256", style: Theme.of(context).textTheme.bodyLarge,),
        Text("Photos", style: Theme.of(context).textTheme.bodySmall,),
      ],
    );
  }
}
