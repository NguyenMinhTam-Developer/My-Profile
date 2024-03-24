import 'package:get/get.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/sources/local/user_local_data_source.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/user_repository.dart';

class HomePageController extends GetxController {
  final UserRespository _userRespository;

  HomePageController({
    required UserRespository userRespository,
  }) : _userRespository = userRespository;

  Rx<bool> isLoading = Rx(false);
  Rx<UserEntity> currentUser = Rx(UserEntity.me());

  Future<void> updateUserAvatar(String imagePath) async {
    currentUser.value = currentUser.value.copyWith(avatar: imagePath);
    currentUser.value = await _userRespository.updateUser(currentUser.value);

    return;
  }

  Future<void> updateUser() async {
    currentUser.value = await _userRespository.updateUser(currentUser.value);

    return;
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    isLoading.value = true;

    _userRespository.getUser().then((user) async {
      if (user == null) {
        currentUser = Rx(await _userRespository.updateUser(UserEntity.me()));
      } else {
        currentUser = Rx(user);
      }

      isLoading.value = false;
    });
  }
}

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(
        userRespository: UserRepositoryImpl(
          userLocalDataSource: UserLocalDataSource(),
        ),
      ),
    );
  }
}
