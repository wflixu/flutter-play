import 'package:flutter/material.dart';

import './home/home_screen.dart';
import './constants.dart' show AppColors;


void main() => runApp(MaterialApp(
  title: 'weixin',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.appBarColor),
    cardColor: Color(AppColors.appBarColor)
  ),
  home: HomeScreen()
));

