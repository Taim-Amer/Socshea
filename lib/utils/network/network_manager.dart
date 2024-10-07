// // ignore_for_file: unrelated_type_equality_checks
// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// class TNetworkManager extends GetxController {
//   static TNetworkManager get instance => Get.find();
//
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
//       _updateConnectionStatus(result);
//       },
//     );
//   }
//
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectivityStatus.value = result;
//     if (_connectivityStatus.value == ConnectivityResult.none) {
//       // TLoaders.warningSnackBar(title: "No Internet Connection");
//     }
//   }
//
//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       if (result == ConnectivityResult.none) {
//         return false;
//       } else {
//         return true;
//       }
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class TNetworkManager {
  TNetworkManager._privateConstructor();
  static final TNetworkManager instance = TNetworkManager._privateConstructor();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult connectivityStatus = ConnectivityResult.none;

  void initialize() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectivityStatus = result;
    if (connectivityStatus == ConnectivityResult.none) {
      print("===============================");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }
}


