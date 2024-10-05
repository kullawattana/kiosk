import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageLanguageService {
  Future<String?> read({required String key}) async {
    return await const FlutterSecureStorage().read(
      key: key,
    );
  }

  Future<void> write({required String key, required String? value}) async {
    return await const FlutterSecureStorage().write(
      key: key,
      value: value,
    );
  }

  Future<void> delete({required String key}) async {
    return await const FlutterSecureStorage().delete(
      key: key,
    );
  }
}
