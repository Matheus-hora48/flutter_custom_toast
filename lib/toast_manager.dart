import 'package:flutter/material.dart';

class ToastManager {
  static final ToastManager _instance = ToastManager._internal();

  factory ToastManager() => _instance;

  ToastManager._internal();

  void showToast({
    required String message,
    Color backgroundColor = Colors.black,
    TextStyle textStyle = const TextStyle(color: Colors.white),
    Duration duration = const Duration(seconds: 2),
    ToastPosition position = ToastPosition.bottom,
  }) {
    final overlay = _getOverlay();
    if (overlay == null) return;

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: position == ToastPosition.bottom ? 50 : null,
        top: position == ToastPosition.top ? 50 : null,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: _ToastWidget(
            message: message,
            backgroundColor: backgroundColor,
            textStyle: textStyle,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }

  OverlayState? _getOverlay() {
    final context = NavigatorKey.currentContext;
    if (context == null) {
      return null; 
    }

    final navigator = Navigator.of(context);
    return navigator.overlay;
  }
}

class _ToastWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;

  const _ToastWidget({
    required this.message,
    required this.backgroundColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

enum ToastPosition { top, bottom }

// ignore: non_constant_identifier_names
final GlobalKey<NavigatorState> NavigatorKey = GlobalKey<NavigatorState>();
