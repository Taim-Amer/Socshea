import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/common/widgets/appbar/appbar.dart';
import 'package:socshea/features/social/feeds/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:socshea/utils/device/device_utility.dart';

class TCreatePostAppbar extends StatelessWidget implements PreferredSizeWidget{
  const TCreatePostAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(title: const Text("Create Post"), actions: [TextButton(onPressed: () => context.read<CreatePostCubit>().createPost(context), child: const Text("Post"))], showBackArrow: true);
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}