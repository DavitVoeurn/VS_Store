
import 'package:json_annotation/json_annotation.dart';
part 'otp_verify.g.dart';

@JsonSerializable()
class OtpVerify {
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'code')
  String? code;

  OtpVerify({this.phoneNumber, this.code});

  factory OtpVerify.fromJson(Map<String, dynamic> json) => _$OtpVerifyFromJson(json);

  static List<OtpVerify> fromList(List<Map<String, dynamic>> list) {
    return list.map(OtpVerify.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$OtpVerifyToJson(this);
}