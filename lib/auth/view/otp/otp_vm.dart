import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vs_store/auth/repo/auth_repo.dart';
import 'package:vs_store/common/response_status.dart';

class OtpVm  with ChangeNotifier {
  final AuthRepo _authRepo = Get.find<AuthRepo>();
  ResponseStatus<bool> _responseStatus = ResponseStatus.initial();
  ResponseStatus<bool> get responseStatus => _responseStatus;

  void VerifyOtp(String phoneNumber,code) async {
    _responseStatus = ResponseStatus.loading();
    notifyListeners();
    _responseStatus = await _authRepo.requestVerifyOtp(phoneNumber,code);
    notifyListeners();
  }
}
