import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:netease/common/icon.dart';
import 'package:netease/config/http.dart';
import 'package:netease/config/api.dart';
import 'package:netease/common/colors.dart';
import 'package:netease/model/banner.dart' as BannerList;
import 'package:netease/model/songlist.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    _getBanner();
    _getSongsList();
    super.initState();
  }

  List bannerList = [];
  List songsList = [];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: (bannerList != null && bannerList.length == 0)
        ? CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          )
        : SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  _header(),
                  _banner(),
                  _icons(),
                  _songs(),
                  _newest()           
                ],
              ),
            )
          ),
    );
  }

  Widget _header(){
    return(
      Container(
        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25), right: ScreenUtil.getInstance().setWidth(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              AntdIcons.voice,
              size: ScreenUtil.getInstance().setSp(50),
            ),
            Container(
              height: ScreenUtil.getInstance().setHeight(50),
              width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(200),
              decoration: BoxDecoration(
                // border: Border.all(width: 1, color: Colors.grey),
                color: grey,
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setHeight(25)))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    AntdIcons.search,
                    size: ScreenUtil.getInstance().setSp(30),
                    color: grey1,
                  ),
                  Text('搜索', style: TextStyle(color: grey1),)
                ],
              ),
            ),
            Icon(
              AntdIcons.playing,
              size: ScreenUtil.getInstance().setSp(40),
            )
          ],
        )
      )
    );
  }

  Widget _banner(){
    return(
      Container(
        margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
        height: ScreenUtil.getInstance().setHeight(200),
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25), right: ScreenUtil.getInstance().setWidth(25)),
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    bannerList[index].pic,
                  ),
                  fit: BoxFit.fill
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)
                )
              ),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil.getInstance().setWidth(120),
                  height: ScreenUtil.getInstance().setHeight(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    color: bannerList[index].typeTitle == '独家' ? red : blue,
                  ),
                  child: Text(
                    bannerList[index].typeTitle, 
                    style: TextStyle(color: white),
                  ),
                ),
              )
            );
          },
          autoplay: true,
          itemCount: bannerList.length,
          pagination: new SwiperPagination(
            margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, ScreenUtil.getInstance().setHeight(8)),
            builder: new DotSwiperPaginationBuilder(
                color: grey1,
                activeColor: red,
                size: ScreenUtil.getInstance().setSp(12),
                activeSize: ScreenUtil.getInstance().setSp(12)
              )
          ),
        ),
      )
    );
  }

  Widget _icons(){
    return(
      Container(
        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25), right: ScreenUtil.getInstance().setWidth(25), bottom: ScreenUtil.getInstance().setHeight(30)),
        margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffdddddd)))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(100),
                  height: ScreenUtil.getInstance().setWidth(100),
                  margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(12)),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setHeight(50)))
                  ),
                  child: Icon(
                    AntdIcons.calender,
                    size: ScreenUtil.getInstance().setSp(50),
                    color: white,
                  ),
                ),
                Text('每日推荐')
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(100),
                  height: ScreenUtil.getInstance().setWidth(100),
                  margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(12)),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setHeight(50)))
                  ),
                  child: Icon(
                    AntdIcons.list,
                    size: ScreenUtil.getInstance().setSp(50),
                    color: white,
                  ),
                ),
                Text('歌单')
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(100),
                  height: ScreenUtil.getInstance().setWidth(100),
                  margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(12)),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setHeight(50)))
                  ),
                  child: Icon(
                    AntdIcons.rank,
                    size: ScreenUtil.getInstance().setSp(50),
                    color: white,
                  ),
                ),
                Text('排行榜')
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(100),
                  height: ScreenUtil.getInstance().setWidth(100),
                  margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(12)),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setHeight(50)))
                  ),
                  child: Icon(
                    AntdIcons.fm,
                    size: ScreenUtil.getInstance().setSp(50),
                    color: white,
                  ),
                ),
                Text('电台')
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(100),
                  height: ScreenUtil.getInstance().setWidth(100),
                  margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(12)),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setHeight(50)))
                  ),
                  child: Icon(
                    AntdIcons.live,
                    size: ScreenUtil.getInstance().setSp(50),
                    color: white,
                  ),
                ),
                Text('直播')    
              ],
            )       
          ],
        ),
      )
    );
  }

  Widget _songs(){
    return(
      Container(
        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25), right: ScreenUtil.getInstance().setWidth(25)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: ScreenUtil.getInstance().setWidth(40), bottom: ScreenUtil.getInstance().setWidth(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '推荐歌单',
                    style: TextStyle(color: black, fontSize: ScreenUtil.getInstance().setSp(35), fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil.getInstance().setWidth(150),
                      height: ScreenUtil.getInstance().setHeight(45),
                      decoration: BoxDecoration(
                        border: Border.all(color: grey1, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child: Text('歌单广场'),
                    ),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: songsList.length,
              physics: NeverScrollableScrollPhysics(),
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){},
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        height: (MediaQuery.of(context).size.width - ScreenUtil.getInstance().setHeight(70))/3,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              songsList[index].picUrl,
                            ),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(5)
                          )
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: ScreenUtil.getInstance().setWidth(1), right: ScreenUtil.getInstance().setWidth(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                AntdIcons.playCount,
                                size: ScreenUtil.getInstance().setSp(24),
                                color: white,
                              ),
                              Text(
                                songsList[index].playCount > 100000000 ? (songsList[index].playCount~/100000000).toString() + '亿' : songsList[index].playCount > 10000 ? (songsList[index].playCount~/10000).toString() + '万' :  songsList[index].playCount,
                                style: TextStyle(
                                  color: white,
                                  fontSize: ScreenUtil.getInstance().setSp(24)
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(10)),
                        child: Text(
                          songsList[index].name,
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(26)),
                        ),
                      ),
                    ],
                  )
                );
              },
            )
          ],
        ),
      )      
    );
  }

  Widget _newest(){
    return(
      Container(
        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25), right: ScreenUtil.getInstance().setWidth(25)),
        
      )
    );
  }

  void _getBanner() async{
    var res = await HttpUtil().post(Api.Banner+'?type=2');
    var data = json.decode(res.toString());
    BannerList.Banner list = BannerList.Banner.fromJson(data);
    print(list.banners[0].pic);
    setState(() {
      bannerList = list.banners;
    });
    print(bannerList);
  }

  void _getSongsList() async{
    var res = await HttpUtil().post(Api.Recommend+'?limit=6');
    var data = json.decode(res.toString());
    Songlist list = Songlist.fromJson(data);
    print(list.result[0].name);
    setState(() {
      songsList = list.result;
    });
  }

  void _getNewAlbum() async{

  }
}