import 'package:flutter/material.dart';
import 'package:netease/common/icon.dart';
import 'package:netease/common/colors.dart';
import 'package:netease/pages/home/home.dart';
import 'package:netease/pages/my/my.dart';
import 'package:netease/pages/cloud/cloud.dart';
import 'package:netease/pages/account/account.dart';
import 'package:netease/pages/video/video.dart';


class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          VideoPage(),
          MyPage(),
          CloudPage(),
          AccountPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(AntdIcons.home, color: _defaultColor),
            activeIcon: Icon(AntdIcons.home, color: red),
            title: Text('发现', style: TextStyle(
              color: _currentIndex != 0 ? _defaultColor : red
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(AntdIcons.video, color: _defaultColor),
            activeIcon: Icon(AntdIcons.video, color: red),
            title: Text('视频', style: TextStyle(
              color: _currentIndex != 1 ? _defaultColor : red
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(AntdIcons.my, color: _defaultColor),
            activeIcon: Icon(AntdIcons.my, color: red),
            title: Text('我的', style: TextStyle(
              color: _currentIndex != 2 ? _defaultColor : red
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(AntdIcons.cloud, color: _defaultColor),
            activeIcon: Icon(AntdIcons.cloud, color: red),
            title: Text('云村', style: TextStyle(
              color: _currentIndex != 3 ? _defaultColor : red
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(AntdIcons.account, color: _defaultColor),
            activeIcon: Icon(AntdIcons.account, color: red),
            title: Text('账号', style: TextStyle(
              color: _currentIndex != 4 ? _defaultColor : red
            ))
          )
      ]),
    );
  }
}