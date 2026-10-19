import 'package:moviles_auth/features/register/domain/app_user.dart';

abstract class AuthRepository {
  Future<AppUser> signup(String email, String password);
}
