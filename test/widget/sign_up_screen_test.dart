import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:xullo/core/widgets/custom_textfield.dart';
import 'package:xullo/core/widgets/app_button.dart';
import 'package:xullo/features/auth/presentation/screens/sign_up_screen.dart';

void main() {
  testWidgets('SignUpScreen renders correctly and validates form', (WidgetTester tester) async {
    tz.initializeTimeZones();
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: SignUpScreen()),
      ),
    );

    // Find text fields
    final firstNameField = find.byWidgetPredicate(
          (widget) => widget is CustomTextField && widget.hintText == 'First Name',
    );
    final lastNameField = find.byWidgetPredicate(
          (widget) => widget is CustomTextField && widget.hintText == 'Last Name',
    );
    final emailField = find.byWidgetPredicate(
          (widget) => widget is CustomTextField && widget.hintText == 'Email',
    );
    final passwordField = find.byWidgetPredicate(
          (widget) => widget is CustomTextField && widget.hintText == 'Password',
    );

    expect(firstNameField, findsOneWidget);
    expect(lastNameField, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);

    // Enter sample data
    await tester.enterText(firstNameField, 'John');
    await tester.enterText(lastNameField, 'Doe');
    await tester.enterText(emailField, 'john@example.com');
    await tester.enterText(passwordField, 'Password@123');

    // Find the AppButton
    final createButtonFinder = find.byType(AppButton);
    expect(createButtonFinder, findsOneWidget);

    // Call the onPressed function directly
    final appButton = tester.widget<AppButton>(createButtonFinder);
    appButton.onPressed?.call();

    // Rebuild the widget
    await tester.pump();
  });
}
