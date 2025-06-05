import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vs_store/auth/model/otp_request.dart';
import 'package:vs_store/auth/model/otp_verify.dart';
part 'auth_api.g.dart';

@RestApi(baseUrl: '/api/v1/auth')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  @POST('/otp/request')
  Future<bool> requestOtp(@Body() OtpRequest request);

  @POST('/otp/verify')
  Future<bool> requestVerifyOtp(@Body() OtpVerify request);
}
