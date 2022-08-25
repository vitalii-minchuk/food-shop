class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  bool? isExist;
  int? quantity;
  String? time;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExist,
      this.quantity,
      this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }
}