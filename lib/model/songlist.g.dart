// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Songlist _$SonglistFromJson(Map<String, dynamic> json) {
  return Songlist(
    json['hasTaste'] as bool,
    json['code'] as int,
    json['category'] as int,
    (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SonglistToJson(Songlist instance) => <String, dynamic>{
      'hasTaste': instance.hasTaste,
      'code': instance.code,
      'category': instance.category,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['id'] as int,
    json['type'] as int,
    json['name'] as String,
    json['copywriter'] as String,
    json['picUrl'] as String,
    json['canDislike'] as bool,
    json['trackNumberUpdateTime'] as int,
    json['playCount'] as int,
    json['trackCount'] as int,
    json['highQuality'] as bool,
    json['alg'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'copywriter': instance.copywriter,
      'picUrl': instance.picUrl,
      'canDislike': instance.canDislike,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'playCount': instance.playCount,
      'trackCount': instance.trackCount,
      'highQuality': instance.highQuality,
      'alg': instance.alg,
    };
