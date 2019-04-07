import 'package:flutter/material.dart';

import '../constants.dart' show Constants, AppColors;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: Icon(icon, color: Color(AppColors.tabIcon)),
            activeIcon: Icon(activeIcon, color: Color(AppColors.tabIconActive)),
            title: Text(title,style: TextStyle(
              fontSize: 14.0
            ),),
            backgroundColor: Colors.white);
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.iconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.iconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe601,
          fontFamily: Constants.iconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.iconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(0xe600, fontFamily: Constants.iconFontFamily),
        activeIcon: IconData(0xe671, fontFamily: Constants.iconFontFamily),
      ),
      NavigationIconView(
        title: '我的',
        icon: IconData(0xe6c0, fontFamily: Constants.iconFontFamily),
        activeIcon: IconData(0xe626, fontFamily: Constants.iconFontFamily),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          print('tap $index item');
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('点击了搜索按钮！');
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('显示下拉列表!');
            },
          )
        ],
      ),
      body: Container(
        color: Colors.redAccent,
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
