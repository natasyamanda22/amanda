import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugaskalkulator/main.dart';

void main() {
  testWidgets('Login and navigate to HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(TextField), findsNWidgets(2)); // Username and password
    expect(find.text('Login'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'testuser');
    await tester.enterText(find.byType(TextField).last, 'testpass');

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Menu Utama'), findsOneWidget);
  });
}