import 'package:flutter/material.dart';

class AppColors {
  static const appBarColor = 0xff303030;
  static const tabIconActive = 0xff46c11b;
  static const tabIcon = 0xff999999;
  static const appBarPopMenuTextColor=0xffffffff;
  static const conversationTitleColor = 0xff353535;
  static const conversationItemBg = 0xffffffff;
  static const desTextColor = 0xff9e9e9e;
  static const dividerColor =0xffd9d9d9;
}

class AppStyle {
  static const TitleStyle = TextStyle(
     fontSize: 14.0,
     color: Color(AppColors.conversationTitleColor)
  );
  static const DesStyle = TextStyle(
     fontSize: 12.0,
     color: Color(AppColors.desTextColor)
  );
}
class Constants {
  static const iconFontFamily ='appIconFont';
  static const conversationAvatarSize = 64.0;
  static const dividerWidth = 1.0;
}