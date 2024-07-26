import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:svitstask/config/logs/app_bloc_observer.dart';
import 'package:svitstask/config/logs/app_dio_interceptor.dart';
import 'package:svitstask/core/data/data_source/local/local_data_source.dart';
import 'package:svitstask/core/data/data_source/local/real_local_data_source.dart';
import 'package:svitstask/core/data/data_source/remote/remote_data_source.dart';
import 'package:svitstask/core/data/repository/app_repository_impl.dart';
import 'package:svitstask/core/domain/repository/app_repository.dart';
import 'package:svitstask/core/presentation/bloc/app_bloc.dart';
import 'package:svitstask/feature/user/data/repository/user_list_repository_impl.dart';
import 'package:svitstask/feature/user/domain/repository/user_list_repository.dart';
import 'package:svitstask/feature/user/presentation/user_detail/bloc/user_detail_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_list/bloc/user_list_bloc.dart';

/// [locator] is an instance of [GetIt] for dependency injection.
final GetIt locator = GetIt.instance;

/// Sets up the service locator with necessary dependencies.
Future<void> setupLocator() async {
  /// Third-party API setup
  final db = await LocalDataSourceImpl.init;
  Bloc.observer = LogBlocObserver();

  /// Data Source registration
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(db: db));
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(interceptor: const DioInterceptor()));

  /// Repository registration
  locator.registerLazySingleton<UserListRepository>(() => UserListRepositoryImpl(remoteDS: locator()));
  locator.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(localDS: locator()));

  /// Bloc registration
  locator.registerFactory<UserDetailBloc>(() => UserDetailBloc(repository: locator()));
  locator.registerFactory<UserListBloc>(() => UserListBloc(repository: locator()));
  locator.registerFactory<AppBloc>(() => AppBloc(repository: locator()));
}
