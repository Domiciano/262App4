import 'package:moviles_auth/features/register/data/profile_data_source.dart';
import 'package:moviles_auth/features/register/domain/profile.dart';
import 'package:moviles_auth/features/register/domain/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  //Dependencias

  ProfileDataSource source = ProfileDataSource();

  @override
  Future<void> create(Profile profile) async {
    await source.createUser(profile);
  }
}
