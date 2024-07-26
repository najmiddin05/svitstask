import 'package:svitstask/config/constants/app_keys.dart';
import 'local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [LocalDataSourceImpl] is an implementation of [LocalDataSource]
/// that uses the SharedPreferences package to store, read, and remove data locally.
class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences db;

  const LocalDataSourceImpl({required this.db});

  /// Initializes and returns an instance of [SharedPreferences].
  static Future<SharedPreferences> get init async {
    return SharedPreferences.getInstance();
  }

  /// Reads the data associated with the given [key] from SharedPreferences.
  ///
  /// [key]: The key to read the data.
  ///
  /// Returns the data as a [String], or `null` if no data is found.
  @override
  String? read(StorageKey key) {
    return db.getString(key.name);
  }

  /// Removes the data associated with the given [key] from SharedPreferences.
  ///
  /// [key]: The key to remove the data.
  ///
  /// Returns a [Future] that completes with `true` if the data was successfully removed,
  /// and `false` otherwise.
  @override
  Future<bool> remove(StorageKey key) async {
    return db.remove(key.name);
  }

  /// Stores a string [data] with the given [key] in SharedPreferences.
  ///
  /// [key]: The key to store the data.
  /// [data]: The data to be stored.
  ///
  /// Returns a [Future] that completes with `true` if the data was successfully stored,
  /// and `false` otherwise.
  @override
  Future<bool> store(StorageKey key, String data) async {
    return db.setString(key.name, data);
  }
}
