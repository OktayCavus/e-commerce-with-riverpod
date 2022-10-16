import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ProductRiverpod extends ChangeNotifier {
  List <ProductModel> products = [];
  List <ProductModel> favorites = [];
  List <ProductModel> basketProducts = [];
  double totalPrice = 0.0;

void increasePrice(ProductModel model){
  totalPrice += model.price;
}
void decreasePrice(ProductModel model){
  totalPrice -= model.price;
}

  void setFavorite(ProductModel model){
    if(model.isFavorite){
      model.isFavorite= false;
      favorites.remove(model);
      notifyListeners();
    }else{
      model.isFavorite= true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void removeItem(ProductModel model){
    if(basketProducts.length>0){
      basketProducts.remove(model);
      decreasePrice(model);
      notifyListeners();
    }
    Grock.snackBar(
      title: 'Başarılı',
      description: "${model.title} silme basarılı");
      
  }

  void addedBasket(ProductModel model){
    basketProducts.add(model);
    increasePrice(model);
    Grock.snackBar(
      title: 'Başarılı',
      description: "${model.title} başarıyla sepete eklendi",
      leading: Icon(Icons.check));

  }

  // bu oluşturduğumuız fonksiyonu baseScaffold'da çağıracaz
  void init (){
    for(int i = 0; i<15 ; i++){
     products.add(
      ProductModel(
        isFavorite: false,
        // i.randomImage() Grock paketinin özelliği
        imagePath: i.randomImage(),
        title: 'Iphone 11',
        price: 6000,
        description: 'Iphone 11 Black 64 gb')
        );
    }
  }
}