import 'package:moviles_auth/features/register/data/auth_data_source.dart';
import 'package:moviles_auth/features/register/domain/app_user.dart';
import 'package:moviles_auth/features/register/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  //Obtener la dependencia
  //GET IT
  AuthDataSource source = AuthDataSource();

  Future<AppUser> signup(String email, String password) async {
    AppUser user = await source.signup(email, password);
    return user;
  }
}
