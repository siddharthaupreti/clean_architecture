import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/data_source/comment_data_source.dart';
import '../../data/repositoryImpl/repoImpl.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/use_cases/use_case.dart';
import '../network/network_info.dart';
import '../network/network_utils.dart';

final di = GetIt.instance;

class ServiceLocator {
  static init() async {
    ///posts data source
    di.registerLazySingleton<CommentRemoteDataSource>(
        () => CommentRemoteDataSourceImpl(networkUtil: di()));

    ///posts repository
    di.registerLazySingleton<CommentRepository>(() => CommentRepositoryImpl(
        networkInfo: di(), commentRemoteDataSource: di()));

    ///posts use case
    di.registerLazySingleton<GetCommentUseCase>(
        () => GetCommentUseCaseImpl(commentRepository: di()));

    ///dio
    di.registerLazySingleton(() => Dio());

    ///network info
    di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

    ///network util
    di.registerLazySingleton(() => NetworkUtil(dio: di()));

    ///internet connection
    di.registerLazySingleton(() => InternetConnectionChecker());
  }
}
