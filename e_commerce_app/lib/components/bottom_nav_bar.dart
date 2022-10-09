/* import 'package:e_commerce_app/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);
    return BottomNavigationBar(
      items: read.items ,
      // currentIndex' i okuyacağımız için watch ile verdik ani değişir
      currentIndex: watch.currentIndex,
      // onTap int deger alıyor hangi iteme basdıysak int o degeri
      // alacak ve currentIndex ' e eşitleyecek
      onTap: (index){read.setCurrentIndex(index);},
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/riverpod_management.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  // bottomNavBarRiverpod ' u sürekli izliyoruz
// burası bottom nav barın hangi indexte olduğunu bottomnavbarriverpod içindeki setCurrentIndex'e yolluyor
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);
    return BottomNavigationBar(
      items: read.items,
      currentIndex: watch.currentIndex,
      onTap: (index) => read.setCurrentIndex(index),
    );
  }
}