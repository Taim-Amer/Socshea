import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/app.dart';
import 'package:socshea/bloc_observer.dart';
import 'package:socshea/firebase_options.dart';
import 'package:socshea/utils/dependencies/service_locator.dart';
import 'package:socshea/utils/storage/cache_helper.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await TCacheHelper().init();

  Bloc.observer = MyBlocObserver();

  initServiceLocator();

  runApp(const App());
}

