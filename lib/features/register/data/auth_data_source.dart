import 'package:moviles_auth/features/register/domain/app_user.dart';
import 'package:moviles_auth/features/register/domain/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource {
  //GoTrue

  Future<AppUser> signup(String email, String password) async {
    AuthResponse response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
    if (response.user != null) {
      return AppUser(id: response.user!.id, email: email, password: password);
    } else {
      throw Exception("Error with signup");
    }
  }
}
