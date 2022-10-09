import 'package:e_commerce_app/riverpod/product_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottom_nav_bar_riverpod.dart';

final bottomNavBarRiverpod = ChangeNotifierProvider((_) => BottomNavBarRiverpod());

final productRiverpod = ChangeNotifierProvider((_) => ProductRiverpod());


