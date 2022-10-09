

import 'package:e_commerce_app/view/basket/basket.dart';
import 'package:e_commerce_app/view/favorite/favorite.dart';
import 'package:e_commerce_app/view/home/home.dart';
import 'package:flutter/cupertino.dart';


class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Anasayfa"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: "Favoriler"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: "Sepet"),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

    String appbarTitle() {
    switch (currentIndex) {
      case 0:
        return "Anasayfa";
      case 1:
        return "Favoriler";
      case 2:
        return "Sepet";
      default:
        return "Boş";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return FavoritePage();
      case 2:
        return BasketPage();
      default:
        return HomePage();
    }
  }
}