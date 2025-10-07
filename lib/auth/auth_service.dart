import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with email and password
  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      print("Attempting to sign in: $email");
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print("Sign in successful: ${response.user?.email}");
      return response;
    } catch (e) {
      print("Sign in failed: $e");
      rethrow;
    }
  }

  // Sign up with email and password
  Future<AuthResponse> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      print("Attempting to sign up: $email");
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        print("Sign up successful: ${response.user!.email}");
      } else {
        print("Sign up completed, but user needs email confirmation.");
      }
      return response;
    } catch (e) {
      print("Sign up failed: $e");
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
      print("User signed out successfully.");
    } catch (e) {
      print("Sign out failed: $e");
      rethrow;
    }
  }

  // Get current user email
  String? getCurrentUser() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
