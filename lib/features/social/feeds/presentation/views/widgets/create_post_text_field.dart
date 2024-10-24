import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/social/feeds/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:socshea/utils/constants/text_strings.dart';

class TCreatePostTextField extends StatelessWidget {
  const TCreatePostTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<CreatePostCubit>().postTextController,
      decoration: const InputDecoration(
        hintText: TTexts.yourMind,
        hintStyle: TextStyle(
          fontSize: 20,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
