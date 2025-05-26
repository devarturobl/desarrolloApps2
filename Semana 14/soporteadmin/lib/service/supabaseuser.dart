import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUser {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      final response = await supabase
          .from('profiles')
          .select()
          .order('created_at', ascending: false);
      return response;
    } catch (error) {
      throw Exception('Error al obtener usuarios: $error');
    }
  }
}
