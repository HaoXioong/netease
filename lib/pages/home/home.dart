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
                  _songs()           
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
          itemCount: bannerList.length
        ),
      )
    );
  }

  Widget _icons(){
    return(
      Container(
        padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25), right: ScreenUtil.getInstance().setWidth(25), bottom: ScreenUtil.getInstance().setHeight(25)),
        margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(25)),
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
      GridView.builder(
        shrinkWrap: true,
        itemCount: songsList.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){},
            child: Container(
              width: ScreenUtil.getInstance().setWidth(120),
              height: ScreenUtil.getInstance().setHeight(120),
              decoration: ShapeDecoration(
                // color: red,
                image: DecorationImage(
                  image: NetworkImage(
                    songsList[index].picUrl,
                  ),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)
                )
              ),
            )
          );
        },
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
}