// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newalbum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Newalbum _$NewalbumFromJson(Map<String, dynamic> json) {
  return Newalbum(
    json['code'] as int,
    (json['albums'] as List)
        ?.map((e) =>
            e == null ? null : Albums.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewalbumToJson(Newalbum instance) => <String, dynamic>{
      'code': instance.code,
      'albums': instance.albums,
    };

Albums _$AlbumsFromJson(Map<String, dynamic> json) {
  return Albums(
    json['name'] as String,
    json['id'] as int,
    json['type'] as String,
    json['size'] as int,
    json['picId'] as int,
    json['blurPicUrl'] as String,
    json['companyId'] as int,
    json['pic'] as int,
    json['picUrl'] as String,
    json['publishTime'] as int,
    json['description'] as String,
    json['tags'] as String,
    json['company'] as String,
    json['briefDesc'] as String,
    json['artist'] == null
        ? null
        : Artist.fromJson(json['artist'] as Map<String, dynamic>),
    json['alias'] as List,
    json['status'] as int,
    json['copyrightId'] as int,
    json['commentThreadId'] as String,
    (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['paid'] as bool,
    json['onSale'] as bool,
    json['picId_str'] as String,
  );
}

Map<String, dynamic> _$AlbumsToJson(Albums instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'size': instance.size,
      'picId': instance.picId,
      'blurPicUrl': instance.blurPicUrl,
      'companyId': instance.companyId,
      'pic': instance.pic,
      'picUrl': instance.picUrl,
      'publishTime': instance.publishTime,
      'description': instance.description,
      'tags': instance.tags,
      'company': instance.company,
      'briefDesc': instance.briefDesc,
      'artist': instance.artist,
      'alias': instance.alias,
      'status': instance.status,
      'copyrightId': instance.copyrightId,
      'commentThreadId': instance.commentThreadId,
      'artists': instance.artists,
      'paid': instance.paid,
      'onSale': instance.onSale,
      'picId_str': instance.picIdStr,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
    json['name'] as String,
    json['id'] as int,
    json['picId'] as int,
    json['img1v1Id'] as int,
    json['briefDesc'] as String,
    json['picUrl'] as String,
    json['img1v1Url'] as String,
    json['albumSize'] as int,
    json['alias'] as List,
    json['trans'] as String,
    json['musicSize'] as int,
    json['topicPerson'] as int,
    json['picId_str'] as String,
    json['img1v1Id_str'] as String,
  );
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picId': instance.picId,
      'img1v1Id': instance.img1v1Id,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'albumSize': instance.albumSize,
      'alias': instance.alias,
      'trans': instance.trans,
      'musicSize': instance.musicSize,
      'topicPerson': instance.topicPerson,
      'picId_str': instance.picIdStr,
      'img1v1Id_str': instance.img1v1IdStr,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return Artists(
    json['name'] as String,
    json['id'] as int,
    json['picId'] as int,
    json['img1v1Id'] as int,
    json['briefDesc'] as String,
    json['picUrl'] as String,
    json['img1v1Url'] as String,
    json['albumSize'] as int,
    json['alias'] as List,
    json['trans'] as String,
    json['musicSize'] as int,
    json['topicPerson'] as int,
    json['img1v1Id_str'] as String,
  );
}

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picId': instance.picId,
      'img1v1Id': instance.img1v1Id,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'albumSize': instance.albumSize,
      'alias': instance.alias,
      'trans': instance.trans,
      'musicSize': instance.musicSize,
      'topicPerson': instance.topicPerson,
      'img1v1Id_str': instance.img1v1IdStr,
    };
