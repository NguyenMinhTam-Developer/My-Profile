import '../../domain/entities/user_entity.dart';
import '../../domain/user_repository.dart';
import '../sources/local/user_local_data_source.dart';

class UserRepositoryImpl implements UserRespository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({
    required this.userLocalDataSource,
  });

  @override
  Future<UserEntity?> getUser() async {
    try {
      final userData = userLocalDataSource.getUser();

      if (userData == null) {
        return null;
      }

      return UserEntity.fromMap(userData);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) async {
    try {
      final updatedUser = await userLocalDataSource.updateUser(user.toMap());

      return UserEntity.fromMap(updatedUser);
    } catch (e) {
      rethrow;
    }
  }
}
