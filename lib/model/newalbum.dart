import 'package:json_annotation/json_annotation.dart'; 
  
part 'newalbum.g.dart';


@JsonSerializable()
  class Newalbum {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'albums')
  List<Albums> albums;

  Newalbum(this.code,this.albums,);

  factory Newalbum.fromJson(Map<String, dynamic> srcJson) => _$NewalbumFromJson(srcJson);

}

  
@JsonSerializable()
  class Albums {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'blurPicUrl')
  String blurPicUrl;

  @JsonKey(name: 'companyId')
  int companyId;

  @JsonKey(name: 'pic')
  int pic;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'tags')
  String tags;

  @JsonKey(name: 'company')
  String company;

  @JsonKey(name: 'briefDesc')
  String briefDesc;

  @JsonKey(name: 'artist')
  Artist artist;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'copyrightId')
  int copyrightId;

  @JsonKey(name: 'commentThreadId')
  String commentThreadId;

  @JsonKey(name: 'artists')
  List<Artists> artists;

  @JsonKey(name: 'paid')
  bool paid;

  @JsonKey(name: 'onSale')
  bool onSale;

  @JsonKey(name: 'picId_str')
  String picIdStr;

  Albums(this.name,this.id,this.type,this.size,this.picId,this.blurPicUrl,this.companyId,this.pic,this.picUrl,this.publishTime,this.description,this.tags,this.company,this.briefDesc,this.artist,this.alias,this.status,this.copyrightId,this.commentThreadId,this.artists,this.paid,this.onSale,this.picIdStr,);

  factory Albums.fromJson(Map<String, dynamic> srcJson) => _$AlbumsFromJson(srcJson);

}

  
@JsonSerializable()
  class Artist {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'img1v1Id')
  int img1v1Id;

  @JsonKey(name: 'briefDesc')
  String briefDesc;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'img1v1Url')
  String img1v1Url;

  @JsonKey(name: 'albumSize')
  int albumSize;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'trans')
  String trans;

  @JsonKey(name: 'musicSize')
  int musicSize;

  @JsonKey(name: 'topicPerson')
  int topicPerson;

  @JsonKey(name: 'picId_str')
  String picIdStr;

  @JsonKey(name: 'img1v1Id_str')
  String img1v1IdStr;

  Artist(this.name,this.id,this.picId,this.img1v1Id,this.briefDesc,this.picUrl,this.img1v1Url,this.albumSize,this.alias,this.trans,this.musicSize,this.topicPerson,this.picIdStr,this.img1v1IdStr,);

  factory Artist.fromJson(Map<String, dynamic> srcJson) => _$ArtistFromJson(srcJson);

}

  
@JsonSerializable()
  class Artists {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'img1v1Id')
  int img1v1Id;

  @JsonKey(name: 'briefDesc')
  String briefDesc;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'img1v1Url')
  String img1v1Url;

  @JsonKey(name: 'albumSize')
  int albumSize;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'trans')
  String trans;

  @JsonKey(name: 'musicSize')
  int musicSize;

  @JsonKey(name: 'topicPerson')
  int topicPerson;

  @JsonKey(name: 'img1v1Id_str')
  String img1v1IdStr;

  Artists(this.name,this.id,this.picId,this.img1v1Id,this.briefDesc,this.picUrl,this.img1v1Url,this.albumSize,this.alias,this.trans,this.musicSize,this.topicPerson,this.img1v1IdStr,);

  factory Artists.fromJson(Map<String, dynamic> srcJson) => _$ArtistsFromJson(srcJson);

}

  
