import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vs_store/auth/api/auth_api.dart';
import 'package:vs_store/auth/repo/auth_repo.dart';

class GetInit {
  static void init() {
    Get.lazyPut(() => Dio(BaseOptions(
      baseUrl: 'https://vs-store-dca300f0255d.herokuapp.com',
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ))..interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
      ),
    )
    );
    Get.lazyPut(() => AuthApi(Get.find<Dio>()));
    Get.lazyPut(() => AuthRepo(Get.find<AuthApi>()));
  }
}