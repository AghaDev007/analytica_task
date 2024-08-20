class CartModel {
  final String productId;
  final String title;
  final double price;
  final int quantity;
  final String image;
  final String userId;

  CartModel(
      {required this.productId,
      required this.title,
      required this.price,
      required this.quantity,
      required this.image,
      required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'image': image,
      'uid': userId
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
        productId: map['productId'] ?? "",
        title: map['title'],
        price: map['price'],
        quantity: map['quantity'],
        image: map['image'],
        userId: map['uid']);
  }
}
