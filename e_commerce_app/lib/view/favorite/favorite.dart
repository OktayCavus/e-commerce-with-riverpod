 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../components/product_widget_item.dart';
import '../../riverpod/riverpod_management.dart';

class FavoritePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var product = ref.watch(productRiverpod);

    return Scaffold(
      body:product.favorites.length == 0 ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Favori yok'),
          OutlinedButton(onPressed: (){
            // bottomnavbarı home 'a yollayacak
            ref.read(bottomNavBarRiverpod).setCurrentIndex(0);
          },
          child: Text('Ürünlere git'))
        ],
      ),) :
      ListView(
        children: [
          Padding(
            padding: [20,0].horizontalAndVerticalP,
            child: Text('Favoriler',
            style: Theme.of(context).textTheme.headline6,),
          ),
    
                Expanded(
            child: GrockList(
              shrinkWrap: true,
              scrollEffect: const NeverScrollableScrollPhysics(),
              padding: [20,15].horizontalAndVerticalP,
              itemCount: product.favorites.length,
              itemBuilder:(context,index){
              return ProductWidget(model: product.favorites[index],
              setFavorite: (){
                product.setFavorite(product.favorites[index]);
              },
              setBasket: (){product.addedBasket(product.favorites[index]);},
              removeItem: (){product.removeItem(product.basketProducts[index]);},
              );
            }
            ),
          )
        ],
      )
    );
  }
} 

/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../components/product_widget_item.dart';
import '../../riverpod/riverpod_management.dart';

class FavoritePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.favorites.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Henüz favorilerin boş, hemen bir şeyler ekle"),
                  OutlinedButton(
                      onPressed: () {
                        ref.read(bottomNavBarRiverpod).setCurrentIndex(0);
                      },
                      child: const Text(
                        "Ürünlere Git",
                      ))
                ],
              ),
            )
          : ListView(
              children: [
                Padding(
                  padding: [20, 15, 20, 0].paddingLTRB,
                  child: Text(
                    "Favoriler",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: GrockList(
                    shrinkWrap: true,
                    itemCount: product.favorites.length,
                    scrollEffect: const NeverScrollableScrollPhysics(),
                    padding: [20, 10].horizontalAndVerticalP,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        model: product.favorites[index],
                        setFavorite: () =>
                            product.setFavorite(product.favorites[index]),
                        setBasket: () =>
                            product.addedBasket(product.favorites[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
} */