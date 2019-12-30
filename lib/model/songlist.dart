import 'package:json_annotation/json_annotation.dart'; 
  
part 'songlist.g.dart';


@JsonSerializable()
  class Songlist {

  @JsonKey(name: 'hasTaste')
  bool hasTaste;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'category')
  int category;

  @JsonKey(name: 'result')
  List<Result> result;

  Songlist(this.hasTaste,this.code,this.category,this.result,);

  factory Songlist.fromJson(Map<String, dynamic> srcJson) => _$SonglistFromJson(srcJson);

}

  
@JsonSerializable()
  class Result {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'copywriter')
  String copywriter;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'canDislike')
  bool canDislike;

  @JsonKey(name: 'trackNumberUpdateTime')
  int trackNumberUpdateTime;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'trackCount')
  int trackCount;

  @JsonKey(name: 'highQuality')
  bool highQuality;

  @JsonKey(name: 'alg')
  String alg;

  Result(this.id,this.type,this.name,this.copywriter,this.picUrl,this.canDislike,this.trackNumberUpdateTime,this.playCount,this.trackCount,this.highQuality,this.alg,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

}

  
