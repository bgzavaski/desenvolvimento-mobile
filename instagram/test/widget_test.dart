import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram/main.dart';

void main() {
  testWidgets('opens the edit profile screen from login', (tester) async {
    await tester.pumpWidget(const InstagramApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).first, 'jacob_w');
    await tester.enterText(find.byType(TextFormField).last, 'password');
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();

    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Jacob West'), findsOneWidget);
  });
}
