import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'code')
  String? code;

  RegisterRequest({this.phoneNumber, this.password, this.code});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
