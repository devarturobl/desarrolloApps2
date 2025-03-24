import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  //Crea un objeto que conecta con el servicio de supabase
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  //Funcion para SingIn
  Future<AuthResponse> signIn(
    String email,
    String password) async {
      return await _supabaseClient.auth
      .signInWithPassword(
        email: email, 
        password: password
      );
    }

  //Funcion para SingUp
  Future<AuthResponse> signUp(
    String email,
    String password) async {
      return await _supabaseClient.auth
      .signUp(email: email, password: password);
    }


  //Funcion para SingOut
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }


  //Funcion para obtener el usuario logeado
  String? getUser() {
    final Session? session = _supabaseClient.auth.currentSession;
    final User? user = session?.user;
    return user?.email;
  }
}
