import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:youapp/auth/login/login.dart';
import 'package:youapp/login/login_bloc.dart';
import 'package:youapp/widgets/ptb_go_button.dart';

class MockCallBack extends Mock {
  void call();
}

void main() {
  group('YouApp Button Login Tests', () {
    testWidgets('should trigger onPressed callback when button is enable',
        (tester) async {
      final mockCallBack = MockCallBack();
      const key = Key('login_button');
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: YouAppButton(
            key: key,
            onPressed: mockCallBack,
            isEnabled: true,
            child: const Text('Login'),
          ),
        ),
      ));
    });
  });

  testWidgets(
      'two TextFormField widgets (email and password) should be found for login widget',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginWidget(),
          ),
        ),
      ),
    );

    // Ensure the widget tree is fully built
    await tester.pumpAndSettle();

    // Verify if the TextFormField widgets for email and password are present
    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);

    // Enter text into the email TextFormField
    await tester.enterText(
        find.byKey(const Key('emailField')), 'testing@gmail.com');

    // Enter text into the password TextFormField
    await tester.enterText(
        find.byKey(const Key('passwordField')), 'TestingPassword');

    // Verify the entered text
    expect(find.text('testing@gmail.com'), findsOneWidget);
    expect(find.text('TestingPassword'), findsOneWidget);
  });
}
