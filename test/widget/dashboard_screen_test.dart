import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/features/auth/domain/entities/user.dart';
import 'package:xullo/features/auth/presentation/controller/auth/auth_provider.dart';
import 'package:xullo/features/auth/presentation/controller/auth/state/auth_state.dart';
import 'package:xullo/features/dashboard/presentation/screens/dashboard_screen.dart';

/// ✅ This fake class must extend AuthNotifier (the actual one used in your app)
class FakeAuthNotifier extends AuthNotifier {
  @override
  AuthState build() {
    return AuthState.success(
      User(
        first_name: 'Test',
        last_name: 'User',
        email: 'test@example.com',
        password: '',
        pin: '',
        phone: '',
        license_version: '',
        license_expiry: '',
        dob: '',
        license: '',
      ),
    );
  }
}

void main() {
  testWidgets('DashboardScreen shows static UI when user is logged in', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authNotifierProvider.overrideWith(() => FakeAuthNotifier()), // ✅ This now matches type
        ],
        child: const MaterialApp(
          home: DashboardScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // ✅ Check static UI
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(RefreshIndicator), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.text('Current Status'), findsOneWidget);
    expect(find.text('Until End of Rest'), findsOneWidget);
    expect(find.text('Cumulative Work Period'), findsOneWidget);
    expect(find.text('Cumulative Work Day'), findsOneWidget);

    expect(find.textContaining('Test'), findsWidgets);
  });
}
