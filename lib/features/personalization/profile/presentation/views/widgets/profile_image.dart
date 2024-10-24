import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/features/personalization/profile/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TProfileImage extends StatelessWidget {
  const TProfileImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<ImagePickerCubit, ImagePickerState>(
      builder: (context, state) => Positioned(
        top: TSizes.imageCarouselHeight / 1.5,
        child: GestureDetector(
          onTap: () => context.read<ImagePickerCubit>().pickImage(),
          child: TCircularImage(
            image: state is ImagePickerSuccess ? state.image.path : TImages.user,
            isNetworkImage: state is! ImagePickerSuccess,
            width: 150,
            height: 150,
            backgroundColor: dark ? Colors.black : TColors.white,
          ),
        ),
      ),
    );
  }
}
