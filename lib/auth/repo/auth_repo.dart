import 'package:dio/dio.dart';
import 'package:vs_store/auth/api/auth_api.dart';
import 'package:vs_store/auth/model/otp_request.dart';
import 'package:vs_store/auth/model/otp_verify.dart';
import 'package:vs_store/common/response_status.dart';

import '../view/create password/register_request.dart';

class AuthRepo {
  final AuthApi _authApi;

  AuthRepo(this._authApi);

  Future<ResponseStatus<bool>> requestOtp(String phoneNumber) async {
    try {
      final response = await _authApi.requestOtp(
        OtpRequest(phoneNumber: phoneNumber),
      );
      return ResponseStatus.success(response);
    } on DioException catch (e) {
      print("Error requesting OTP: $e");
      List<dynamic>? errors = e.response?.data['errors'];
      String? message =
          errors != null && errors.isNotEmpty
              ? errors.join(', ')
              : e.response?.data['error_message'];
      ;
      return ResponseStatus.error(message ?? 'Error requesting api');
    }
  }
  Future<ResponseStatus<bool>> requestVerifyOtp(String phoneNumber, String code) async {
    try {
      final response = await _authApi.requestVerifyOtp(
        OtpVerify(phoneNumber: phoneNumber, code: code),
      );
      return ResponseStatus.success(response);
    } on DioException catch (e) {
      print("Error requesting OTP: $e");
      List<dynamic>? errors = e.response?.data['errors'];
      String? message =
          errors != null && errors.isNotEmpty
              ? errors.join(', ')
              : e.response?.data['error_message'];
      ;
      return ResponseStatus.error(message ?? 'Error requesting api');
    }
  }
   Future<ResponseStatus<RegisterRequest>> register({
    required String phoneNumber,
    required String password,
    required String code,
  }) async {
    try {
      final response = await _authApi.register(
        RegisterRequest(
          phoneNumber: phoneNumber,
          password: password,
          code: code,
        ),
      );
      return ResponseStatus.success(response);
    } on DioException catch (e) {
      print("Error registering user: $e");
      List<dynamic>? errors = e.response?.data['errors'];
      String? message =
          errors != null && errors.isNotEmpty
              ? errors.join(', ')
              : e.response?.data['error_message'];
      return ResponseStatus.error(message ?? 'Error registering user');
    }
  }
}
