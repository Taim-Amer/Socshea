import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
          builder: (context, selectedIndex) {
            return NavigationBar(
              height: 70,
              elevation: 0,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) => context.read<NavigationCubit>().setIndex(index),
              backgroundColor: darkMode ? TColors.black : TColors.white,
              indicatorColor: darkMode ? TColors.white.withOpacity(.1) : TColors.black.withOpacity(.1),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home, size: TSizes.iconLg,), label: ""),
                NavigationDestination(icon: Icon(Icons.search, size: TSizes.iconLg,), label: ""),
                NavigationDestination(icon: Icon(Icons.add_circle_outline, size: TSizes.iconLg,), label: ""),
                NavigationDestination(icon: Icon(Iconsax.global, size: TSizes.iconLg,), label: ""),
                NavigationDestination(icon: Icon(Iconsax.user, size: TSizes.iconLg,), label: ""),
              ],
            );
          },
        ),
        body: BlocBuilder<NavigationCubit, int>(
          builder: (context, selectedIndex) {
            final screens = [
              Container(color: Colors.purpleAccent,),
              Container(color: Colors.redAccent,),
              Container(color: Colors.greenAccent,),
              Container(color: Colors.blueAccent,),
              Container(color: Colors.blueAccent,),
              // const HomeScreen(),
              // const StoreScreen(),
              // const FavouriteScreen(),
              // const SettingScreen()
            ];
            return screens[selectedIndex];
          },
        ),
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
