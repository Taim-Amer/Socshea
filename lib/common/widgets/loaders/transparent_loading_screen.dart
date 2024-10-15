import 'package:flutter/material.dart';
import 'package:socshea/utils/constants/colors.dart';

class TestScreen {
  static OverlayEntry? _overlayEntry;

  static OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: TColors.primary.withOpacity(0.7),
            ),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: TColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  static void show(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      final overlay = Overlay.of(context);
      overlay.insert(_overlayEntry!);
    }
  }

  static void remove() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
