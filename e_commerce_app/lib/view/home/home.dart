/* import 'package:e_commerce_app/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../components/product_widget_item.dart';

class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);


    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: [20,0].horizontalAndVerticalP,
            child: Text('Ürünler',
            style: Theme.of(context).textTheme.headline6,),
          ),

          Expanded(
            child: GrockList(
              shrinkWrap: true,
              scrollEffect: const NeverScrollableScrollPhysics(),
              padding: [20,15].horizontalAndVerticalP,
              itemCount: read.products.length,
              itemBuilder:(context,index){
              return ProductWidget(
                model: watch.products[index],
              setFavorite: (){
                read.setFavorite(watch.products[index]);
              },
              setBasket: (){
                read.addedBasket(watch.products[index]);
              },);
            }
            ),
          )
        ],
      )
    );
  }
}

 */

import 'package:e_commerce_app/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import '../../components/product_widget_item.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: [20, 15, 20, 0].paddingLTRB,
            child: Text(
              "Ürünler",
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
            ),
          ),
          Expanded(
            child: GrockList(
              shrinkWrap: true,
              itemCount: read.products.length,
              scrollEffect: const NeverScrollableScrollPhysics(),
              padding: [20, 10].horizontalAndVerticalP,
              itemBuilder: (context, index) {
                return ProductWidget(
                  model: watch.products[index],
                  setFavorite: () => read.setFavorite(watch.products[index]),
                  setBasket: () =>read.addedBasket(watch.products[index]),
                  removeItem: (){},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}