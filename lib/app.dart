import 'package:flutter/material.dart';
import 'package:socshea/features/login/presentation/views/login_screen.dart';
import 'package:socshea/utils/router/app_router.dart';
import 'package:socshea/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      routerConfig: TAppRouter.router,
    );
  }
}