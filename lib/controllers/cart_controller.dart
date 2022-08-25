import 'package:flutter_application_1/data/repository/cart_repo.dart';
import 'package:flutter_application_1/models/cart_madel.dart';
import 'package:flutter_application_1/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(product.id!, () {
      print('add to cart ${product.id} __$quantity');
      return CartModel(
      id: product.id,
      name: product.name,
      price: product.price,
      img: product.img,
      isExist: true,
      quantity: quantity,
      time: DateTime.now().toString(),
    );
    }
    );
  }
}