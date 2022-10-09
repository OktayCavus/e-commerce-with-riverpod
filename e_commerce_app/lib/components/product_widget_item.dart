 import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ProductWidget extends StatelessWidget {

  // model = watch.products[index] eskiden buydu

  ProductModel model ;

  Function setFavorite;
  Function setBasket;
  Function removeItem;

  ProductWidget({required this.model,required this.setFavorite, required this.setBasket,required this.removeItem});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: 10.allBR),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: 18.allBR,
                child: Image.network(model.imagePath),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),),
                      Text(model.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                      ),),

                      SizedBox ( height: 20,),

                      Text(model.price.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),),

                      const SizedBox ( height: 5,),

                      GrockContainer(
                        onTap:() => setBasket(),
                        decoration: BoxDecoration(
                          borderRadius: 10.allBR,
                          color: Colors.white,
                          border: Border.all(color: Colors.blue)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                            Icon(Icons.add_shopping_cart_rounded,color: Colors.black54,),
                            SizedBox(width: 5,),
                            Text('Ekle',
                      style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                      ),),
                          ],
                        ),
                      ),
                  ],),
                ),
              )
            ],
          ),
        ),

        // kalbi sağa almak için
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: GrockContainer(
              onTap: (){
                setFavorite();
              },
              padding: 3.allP,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300,width: 0.5),
                boxShadow: const [BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12
                )]
              ),
              child: Icon(model.isFavorite ? Icons.favorite_rounded :
                Icons.favorite_border_rounded,
                color: model.isFavorite ? Colors.red : Colors.black,
              ),

            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GrockContainer(
              onTap: (){
                removeItem();
              },

              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300,width: 0.5),
                boxShadow: const [BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12
                )]
              ),
              child: Icon(Icons.cancel_outlined,color: Colors.black,),

            ),
          ),
        ),
      ],
    );
  }
}

/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../model/product_model.dart';

class ProductWidget extends StatelessWidget {
  ProductModel model;
  Function setFavorite;
  Function setBasket;
  ProductWidget(
      {required this.model,
      required this.setFavorite,
      required this.setBasket});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: 10.allBR,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: 10.allBR,
                child: Image.network(model.imagePath),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        model.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          model.price.toString() + " ₺",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GrockContainer(
                        onTap: ()=>setBasket(),
                        padding: 3.verticalP,
                        decoration: BoxDecoration(
                          borderRadius: 10.allBR,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add_shopping_cart_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Ekle",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GrockContainer(
              onTap: () => setFavorite(),
              padding: 3.allP,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Icon(
                model.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: model.isFavorite ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
} */