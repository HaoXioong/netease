import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease/common/icon.dart';
import 'package:netease/config/http.dart';
import 'package:netease/config/api.dart';
import 'package:netease/common/colors.dart';
import 'package:netease/model/banner.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25), right: ScreenUtil.getInstance().setWidth(25)),
          child: Column(
            children: <Widget>[
              _header(),
              _banner(),           
            ],
          ),
        )
      ),
    );
  }

  Widget _header(){
    return(
      Row(
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
    );
  }

  Widget _banner(){
    return(
      Row(
        children: <Widget>[
          Icon(
            AntdIcons.voice,
            size: ScreenUtil.getInstance().setSp(30),
          ),
        ],
      )
    );
  }

  void _getBanner() async{
    var res = await HttpUtil().post(Api.Banner+'?type=2');
    var data = json.decode(res.toString());
    BannersList list = BannersList.fromJson(data);
    print(list.banners[0]);

  }
}