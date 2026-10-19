import 'package:moviles_auth/features/register/domain/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDataSource {
  Future<void> createUser(Profile profile) async {
    await Supabase.instance.client.from('profiles').insert({
      'id': profile.id,
      'username': profile.username,
      'full_name': profile.fullName,
      'email': profile.email,
    });
  }
}
