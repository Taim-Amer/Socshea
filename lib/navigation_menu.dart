import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/features/personalization/presentation/views/profile_screen.dart';
import 'package:socshea/features/social/feeds/presentation/views/feeds_screen.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return NavigationBar(
            height: 70,
            elevation: 0,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) => context.read<NavigationCubit>().setIndex(index),
            backgroundColor: dark ? TColors.black : TColors.white,
            indicatorColor: dark ? TColors.white.withOpacity(.1) : TColors.black.withOpacity(.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home, size: TSizes.iconMd,), label: ""),
              NavigationDestination(icon: Icon(Iconsax.video, size: TSizes.iconMd,), label: ""),
              NavigationDestination(icon: Icon(Icons.add_circle_outline, size: TSizes.iconMd,), label: ""),
              NavigationDestination(icon: Icon(Iconsax.notification, size: TSizes.iconMd,), label: ""),
              NavigationDestination(icon: Icon(Iconsax.profile_2user, size: TSizes.iconMd,), label: ""),
            ],
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          final screens = [
            const FeedsScreen(),
            Container(color: Colors.redAccent,),
            Container(color: Colors.greenAccent,),
            Container(color: Colors.blueAccent,),
            const ProfileScreen(),
          ];
          return screens[selectedIndex];
        },
      ),
    );
  }
}

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void setIndex(int index) {
    emit(index);
  }
}
