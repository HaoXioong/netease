import 'package:json_annotation/json_annotation.dart'; 
  
part 'banner.g.dart';


@JsonSerializable()
  class Banner {

  @JsonKey(name: 'banners')
  List<Banners> banners;

  @JsonKey(name: 'code')
  int code;

  Banner(this.banners,this.code,);

  factory Banner.fromJson(Map<String, dynamic> srcJson) => _$BannerFromJson(srcJson);

}

  
@JsonSerializable()
  class Banners {

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'targetId')
  int targetId;

  @JsonKey(name: 'targetType')
  int targetType;

  @JsonKey(name: 'titleColor')
  String titleColor;

  @JsonKey(name: 'typeTitle')
  String typeTitle;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'exclusive')
  bool exclusive;

  @JsonKey(name: 'monitorImpressList')
  List<dynamic> monitorImpressList;

  @JsonKey(name: 'monitorClickList')
  List<dynamic> monitorClickList;

  @JsonKey(name: 'encodeId')
  String encodeId;

  @JsonKey(name: 'bannerId')
  String bannerId;

  @JsonKey(name: 'scm')
  String scm;

  @JsonKey(name: 'requestId')
  String requestId;

  @JsonKey(name: 'showAdTag')
  bool showAdTag;

  Banners(this.pic,this.targetId,this.targetType,this.titleColor,this.typeTitle,this.url,this.exclusive,this.monitorImpressList,this.monitorClickList,this.encodeId,this.bannerId,this.scm,this.requestId,this.showAdTag,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

}