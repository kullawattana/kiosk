import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageLanguageService {
  Future<void> write({required String key, required String? value}) async {
    return await const FlutterSecureStorage().write(
      key: key,
      value: value,
    );
  }
}

class SecureStorageService {
  Future<String?> read({required String key}) async {
    return await const FlutterSecureStorage().read(
      key: key,
    );
  }

  Future<void> write({required String key, required String? value}) async {
    const iosOptions = IOSOptions(
      accessibility: IOSAccessibility.first_unlock_this_device,
    );
    return await const FlutterSecureStorage().write(
      key: key,
      value: value,
      iOptions: iosOptions,
    );
  }
}
