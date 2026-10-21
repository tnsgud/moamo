// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'auth_user_response.dart';
import 'login_response_status.dart';
import 'login_response_token_type.dart';
import 'signup_required_response_status.dart';
import 'signup_required_response_token_type.dart';
import 'login_response.dart';
import 'signup_required_response.dart';


part 'data_sealed.g.dart';

@JsonSerializable(createFactory: false)
sealed class DataSealed {
  const DataSealed();
  
  factory DataSealed.fromJson(Map<String, dynamic> json) =>
      DataSealedDeserializer.tryDeserialize(json);
  
  Map<String, dynamic> toJson();
}

extension DataSealedDeserializer on DataSealed {
  static DataSealed tryDeserialize(Map<String, dynamic> json) {
    try {
      return DataSealedLoginResponse.fromJson(json);
    } catch (_) {}
    try {
      return DataSealedSignupRequiredResponse.fromJson(json);
    } catch (_) {}


    throw FormatException('Could not determine the correct type for DataSealed from: $json');
  }
}

@JsonSerializable()
class DataSealedLoginResponse extends DataSealed implements LoginResponse {
  @override
  final LoginResponseStatus status;
  @override
  final String accessToken;
  @override
  final LoginResponseTokenType tokenType;
  @override
  final int expiresIn;
  @override
  final AuthUserResponse member;

  const DataSealedLoginResponse({
    required this.status,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.member,
  });
  
  factory DataSealedLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$DataSealedLoginResponseFromJson(json);
      
  @override
  Map<String, dynamic> toJson() => _$DataSealedLoginResponseToJson(this);
}
@JsonSerializable()
class DataSealedSignupRequiredResponse extends DataSealed implements SignupRequiredResponse {
  @override
  final SignupRequiredResponseStatus status;
  @override
  final String signupToken;
  @override
  final SignupRequiredResponseTokenType tokenType;
  @override
  final int expiresIn;

  const DataSealedSignupRequiredResponse({
    required this.status,
    required this.signupToken,
    required this.tokenType,
    required this.expiresIn,
  });
  
  factory DataSealedSignupRequiredResponse.fromJson(Map<String, dynamic> json) =>
      _$DataSealedSignupRequiredResponseFromJson(json);
      
  @override
  Map<String, dynamic> toJson() => _$DataSealedSignupRequiredResponseToJson(this);
}
