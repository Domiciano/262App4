import 'package:moviles_auth/features/register/domain/profile.dart';

abstract class ProfileRepository {
  Future<void> create(Profile profile);
}
