import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  //Sing in
  Future<AuthResponse> singInWithEmailAndPassword(
      String email, String password) async {
    return await _supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  //Sing Up
  Future<AuthResponse> singUpWithEmailAndPassword(
  String name,String lastname,String email, String password) async {
    return await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'lastname': lastname,
          'rol': 'Administrador',
        }
    );
  }

  //Sing Out
  Future<void> singOut() async {
    return await _supabase.auth.signOut();
  }

  //Get User Name para ver quien esta logeado
  String? getCurrentUserEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
