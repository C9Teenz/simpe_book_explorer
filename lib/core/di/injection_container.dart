import 'package:get_it/get_it.dart';
import 'package:simple_book_explorer/features/book/domain/repositories/book_repository.dart';

import '../../features/book/data/datasources/book_remote_datasource.dart';
import '../../features/book/data/repositories/book_repository_impl.dart';
import '../../features/book/presentation/bloc/book_bloc.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> initInjectionContainer() async {
  //dio client
  sl.registerLazySingleton(() => DioClient());

  //repositories
  sl.registerLazySingleton<BookRepository>(
      () => BookRepositoryImpl(remoteDataSource: sl()));

  //data sources
  sl.registerLazySingleton<BookRemoteDataSource>(
      () => BookRemoteDataSourceImpl(dioClient: sl()));

  // blocs
  sl.registerFactory(() => BookBloc(sl()));
}
