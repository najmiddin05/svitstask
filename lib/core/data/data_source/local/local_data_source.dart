import 'package:svitstask/config/constants/app_keys.dart';

/// [LocalDataSource] is an abstract class that defines the contract
/// for storing, reading, and removing data locally.
abstract class LocalDataSource {
  /// Stores a string [data] with the given [key].
  ///
  /// [key]: The key to store the data.
  /// [data]: The data to be stored.
  ///
  /// Returns a [Future] that completes with `true` if the data was successfully stored,
  /// and `false` otherwise.
  Future<bool> store(StorageKey key, String data);

  /// Reads the data associated with the given [key].
  ///
  /// [key]: The key to read the data.
  ///
  /// Returns the data as a [String], or `null` if no data is found.
  String? read(StorageKey key);

  /// Removes the data associated with the given [key].
  ///
  /// [key]: The key to remove the data.
  ///
  /// Returns a [Future] that completes with `true` if the data was successfully removed,
  /// and `false` otherwise.
  Future<bool> remove(StorageKey key);
}
