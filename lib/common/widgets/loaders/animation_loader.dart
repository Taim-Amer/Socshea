// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  static Future<void> showLoaderDialog(
    BuildContext context, {
    required String text,
    required String animation,
    bool showAction = false,
    String? actionText,
    VoidCallback? onActionPressed,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            content: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: TAnimationLoaderWidget(
                text: text,
                animation: animation,
                showAction: showAction,
                actionText: actionText,
                onActionPressed: onActionPressed ??
                    () {
                      // If an action is provided, call it and then dismiss
                      Navigator.of(context).pop(); // Dismiss the dialog
                    },
              ),
            ),
          ),
        );
      },
    );
  }

  static void dismissLoaderDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(animation,
                width: MediaQuery.of(context).size.width * .6),
            const SizedBox(height: TSizes.defaultSpace),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.defaultSpace),
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                      onPressed: () {
                        // Dismiss the loader dialog when the button is pressed
                        onActionPressed?.call();
                        dismissLoaderDialog(context);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: TColors.dark,
                      ),
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.light),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
