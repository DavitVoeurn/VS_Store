import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vs_store/auth/repo/auth_repo.dart';
import 'package:vs_store/auth/view/create%20password/register_request.dart';
import 'package:vs_store/common/response_status.dart';

class CreatePasswordVm with ChangeNotifier {
  final AuthRepo _authRepo = Get.find<AuthRepo>();

  ResponseStatus<RegisterRequest> _responseStatus = ResponseStatus.initial();
  ResponseStatus<RegisterRequest> get responseStatus => _responseStatus;

  void register({
    required String phoneNumber,
    required String password,
    required String code,
  }) async {
    try {
      _responseStatus = ResponseStatus.loading();
      notifyListeners();
      
      _responseStatus = await _authRepo.register(
        phoneNumber: phoneNumber,
        password: password,
        code: code,
      );
      notifyListeners();
    } catch (e) {
      _responseStatus = ResponseStatus.error(e.toString());
      notifyListeners();
    }
    
  }

  void resetStatus() {
    _responseStatus = ResponseStatus.initial();
    notifyListeners();
  }
}