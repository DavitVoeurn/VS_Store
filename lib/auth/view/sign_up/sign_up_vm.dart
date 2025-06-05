import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vs_store/auth/repo/auth_repo.dart';
import 'package:vs_store/common/response_status.dart';

class SignUpVm with ChangeNotifier {
  final AuthRepo _authRepo = Get.find<AuthRepo>();

  ResponseStatus<bool> _responseStatus = ResponseStatus.initial();
  ResponseStatus<bool> get responseStatus => _responseStatus;

  void requestOtp(String phoneNumber) async {
    _responseStatus = ResponseStatus.loading();
    notifyListeners();
    _responseStatus = await _authRepo.requestOtp(phoneNumber);
    notifyListeners();
  }
}
