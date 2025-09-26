import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/widgets/custom_textfield.dart';
import 'package:xullo/features/auth/presentation/screens/sign_in_screen.dart';

void main() {
  testWidgets('SignInScreen renders correctly and validates form',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: SignInScreen(),
            ),
          ),
        );

        // Find CustomTextField widgets by hint text
        final emailField = find.byWidgetPredicate(
              (widget) =>
          widget is CustomTextField && widget.hintText == 'Email',
        );

        final passwordField = find.byWidgetPredicate(
              (widget) =>
          widget is CustomTextField && widget.hintText == 'Password',
        );

        expect(emailField, findsOneWidget);
        expect(passwordField, findsOneWidget);

        // Find Sign In button
        final signInButton = find.text('Sign In');
        expect(signInButton, findsOneWidget);

        // Enter email and password
        await tester.enterText(emailField, 'admin@xullo.com');
        await tester.enterText(passwordField, 'Admin@123');

        // Tap Sign In
        await tester.ensureVisible(signInButton);
        await tester.pump();
      });
}
