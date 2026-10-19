import 'package:moviles_auth/features/register/data/profile_repository_impl.dart';
import 'package:moviles_auth/features/register/domain/app_user.dart';
import 'package:moviles_auth/features/register/domain/auth_repository.dart';
import 'package:moviles_auth/features/register/data/auth_repository_impl.dart';
import 'package:moviles_auth/features/register/domain/profile.dart';
import 'package:moviles_auth/features/register/domain/profile_repository.dart';

class SignupUsecase {
  //Dependencias
  AuthRepository authRepository = AuthRepositoryImpl();
  //Luego del igual es un pecado, que permitiremos antes de ver GetIt
  ProfileRepository profileRepository = ProfileRepositoryImpl();

  Future<void> call(
    String email,
    String password,
    String username,
    String fullName,
  ) async {
    //Paso 1
    AppUser user = await authRepository.signup(email, password);
    //Paso 2
    profileRepository.create(
      Profile(
        id: user.id,
        username: username,
        fullName: fullName,
        email: email,
      ),
    );
  }
}
