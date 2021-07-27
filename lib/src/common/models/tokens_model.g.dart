// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokensModel _$TokensModelFromJson(Map<String, dynamic> json) {
  return TokensModel(
    access: json['access'] as String?,
    refresh: json['refresh'] as String?,
  );
}

Map<String, dynamic> _$TokensModelToJson(TokensModel instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
