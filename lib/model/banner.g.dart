// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'] as int,
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'banners': instance.banners,
      'code': instance.code,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners(
    json['pic'] as String,
    json['targetId'] as int,
    json['targetType'] as int,
    json['titleColor'] as String,
    json['typeTitle'] as String,
    json['url'] as String,
    json['exclusive'] as bool,
    json['monitorImpressList'] as List,
    json['monitorClickList'] as List,
    json['encodeId'] as String,
    json['bannerId'] as String,
    json['scm'] as String,
    json['requestId'] as String,
    json['showAdTag'] as bool,
  );
}

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'pic': instance.pic,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'titleColor': instance.titleColor,
      'typeTitle': instance.typeTitle,
      'url': instance.url,
      'exclusive': instance.exclusive,
      'monitorImpressList': instance.monitorImpressList,
      'monitorClickList': instance.monitorClickList,
      'encodeId': instance.encodeId,
      'bannerId': instance.bannerId,
      'scm': instance.scm,
      'requestId': instance.requestId,
      'showAdTag': instance.showAdTag,
    };
