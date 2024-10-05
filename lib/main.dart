import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:socshea/app.dart';
import 'package:socshea/bloc_observer.dart';
import 'package:socshea/utils/dependencies/service_locator.dart';
import 'package:socshea/utils/storage/cache_helper.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await TCacheHelper().init();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  initServiceLocator();

  runApp(const App());
}

