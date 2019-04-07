import 'package:flutter/material.dart';

import '../constants.dart' show Constants, AppColors;
import './conversation_page.dart' show ConversationPage;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum ActionItems { GROUP_CHAP, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            title: Text(
              title,
            ),
            backgroundColor: Colors.white);
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  PageController _pageController;
  List <Widget>_pages;

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
    _pageController = PageController(
       initialPage: _currentIndex,
    );
    _pages = [
      ConversationPage(),
      Container(color: Colors.redAccent,),
      Container(color: Colors.greenAccent,),
      Container(color: Colors.orangeAccent,),
    ];
  }

  _buildPopMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
            IconData(
              iconName,
              fontFamily: Constants.iconFontFamily,
            ),
            size: 22.0,
            color: Color(AppColors.appBarPopMenuTextColor)),
        Container(
          width: 12.0,
        ),
        Text(
          title,
          style: TextStyle(color: Color(AppColors.appBarPopMenuTextColor)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.tabIconActive),
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        _currentIndex = index;
        print('tap $index item');
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex,duration: Duration(milliseconds: 200),curve: Curves.easeInOut);
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('点击了搜索按钮！');
            },
          ),
          Container(
            width: 16.0,
          ),
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     print('显示下拉列表!');
          //   },
          // ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe69e, '发起群聊'),
                  value: ActionItems.GROUP_CHAP,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe638, '添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe61b, '扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe62a, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopMenuItem(0xe63d, '帮助和反馈'),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(Icons.add),
            onSelected: (ActionItems selected) {
              print('点击的是 $selected');
            },
          ),
          Container(
            width: 16.0,
          )
        ],
      ),
      body:PageView.builder(
        itemBuilder: (BuildContext context,int index){
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index){
            setState(() {
              _currentIndex =index; 
            });
        },
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
