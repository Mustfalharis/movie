

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/view/screen/home.dart';

import '../view/screen/Serach_page_screen.dart';
import '../view/screen/category_screen.dart';
import '../view/screen/favorite_screen.dart';
import '../view/screen/settings.dart';
abstract class HomeScreenController extends GetxController
{
  changePage(int index);
}
class HomeScreenControllerImp extends HomeScreenController
{
  int currentPage=0;
  List<Widget>listPage=[
    const HomePage(),
    const Category(),
    const SearchPage(),
    const SettingsScreen(),
  ];

  List bottomAppBar=[
    {"title": "home", "icon": Icons.home},
    {"title": "category", "icon": Icons.category},
    {"title": "search", "icon": Icons.search},
    {"title": "person", "icon": Icons.person}
  ];

  @override
  changePage(int index) {
     currentPage=index;
     update();
  }
}
