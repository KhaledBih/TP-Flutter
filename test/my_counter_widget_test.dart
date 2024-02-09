import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test1/pages/MyCounterWidget.dart'; 
void main() {
  testWidgets('MyCounterWidget increments counter', (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MyCounterWidget());

    // Verify that the initial counter is 0.
    expect(find.text('0'), findsOneWidget);

    // ACT
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Allow time for the widget to rebuild

    // ASSERT
    // Verify that the counter is incremented to 1.
    expect(find.text('1'), findsOneWidget);
  });
}
