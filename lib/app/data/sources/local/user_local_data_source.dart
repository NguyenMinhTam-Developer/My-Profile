import 'package:get_storage/get_storage.dart';
import 'package:logger/web.dart';

class UserLocalDataSource {
  final GetStorage _storage = GetStorage();

  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> user) async {
    Logger().i(user);

    await _storage.write('user', user);

    return user;
  }

  Map<String, dynamic>? getUser() {
    Map<String, dynamic>? user = _storage.read('user');

    Logger().i(user);

    return user;
  }
}
