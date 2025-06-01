import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/data/local/secure_storage/flutter_secure_storage_provider.dart';
import 'package:flutter_riverpod_app/data/local/secure_storage/isucure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider<ISecureStorage>((ref) {
  return SecureStorage(ref.watch(flutterSecureStorageProvider));
});

final class SecureStorage extends ISecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  @override
  Future<void> delete(String key) {
    try {
      return _storage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> read(String key) {
    try {
      return _storage.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> write(String key, String value) {
    try {
      return _storage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAll() {
    try {
      return _storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
