import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:vs_store/auth/view/account/create_password.dart';
import 'package:vs_store/auth/view/otp/otp_vm.dart';
import 'package:vs_store/common/response_status.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber; // Example phone number, replace with actual
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final OtpVm vm = Provider.of<OtpVm>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (vm.responseStatus.status == Status.success) {
        if (vm.responseStatus.data == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreatePassword()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Incorrect OTP')),
          );
        }
      } else if (vm.responseStatus.status == Status.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(vm.responseStatus.message ?? 'Error')),
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "OTP Verification",
          style: TextStyle(color: Color(0xFF757575)),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "We sent your code to +855 858 808 *** \nThis code will expired in 00:30",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF757575)),
                  ),
                  // const SizedBox(height: 16),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      vm.VerifyOtp(phoneNumber, verificationCode);
                    }, // end onSubmit
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(color: Color(0xFF757575)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);
