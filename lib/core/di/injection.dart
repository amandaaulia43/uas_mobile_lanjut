import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../config/env_config.dart';

// Mendaftarkan GetIt instance
final locator = GetIt.instance;

void setupLocator() {
  // 1. Register Dio (Network Client) dengan Base URL dari Environment
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(baseUrl: EnvConfig.baseUrl));
    
    // Menambahkan Logger Interceptor standar bawaan Dio
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  });

  // Nanti kamu bisa tambahkan pendaftaran Repository, Isar, dan Cubit UAS di bawah sini!
}