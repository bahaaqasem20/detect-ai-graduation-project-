/*
Auth Gate - checks if the user is authenticated or not
and redirects to the appropriate screen
--------------------------------------------------------------------------------------------------
If authenticated, redirect to MainScreen
If not authenticated, redirect to SignInScreen
*/
import 'package:detectai_project/screens/basics_screens/login_screen.dart';
import 'package:detectai_project/screens/basics_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return LoginScreen();
          return const Center(child: CircularProgressIndicator());
        }
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return const MainScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
