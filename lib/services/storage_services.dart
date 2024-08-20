import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final _storage = GetStorage();

  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  dynamic read(String key) {
    return _storage.read(key);
  }

  void remove(String key) async {
    return await _storage.remove(key);
  }

  String? getName() {
    return _storage.read('name');
  }

  String? getEmail() {
    return _storage.read('email');
  }

  String? getRefreshToken() {
    return _storage.read('refreshToken');
  }

  String? getAccessToken() {
    return _storage.read('token');
  }

  int getNotificationCount() {
    return _storage.read('notificationCount') ?? 0;
  }

  Future<void> setNotificationCount(int count) async {
    await _storage.write('notificationCount', count);
  }

  void logout() async {
    await _storage.remove('name');
    await _storage.remove('email');
    await _storage.remove('refreshToken');
    await _storage.remove('accessToken');
    await _storage.remove('token');
    await _storage.remove('notificationCount');
  }
}
