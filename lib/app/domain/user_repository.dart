import 'entities/user_entity.dart';

abstract class UserRespository {
  Future<UserEntity?> getUser();

  Future<UserEntity> updateUser(UserEntity user);
}
