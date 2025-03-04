import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_toast/flutter_custom_toast.dart';

void main() {
  testWidgets('Toast is shown and disappears after the set duration', (WidgetTester tester) async {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(title: const Text('Toast Test')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              ToastManager().showToast(
                message: 'Toast Test',
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.blue,
              );
            },
            child: const Text('Show Toast'),
          ),
        ),
      ),
    ));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Toast Test'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Toast Test'), findsNothing);
  });
}
