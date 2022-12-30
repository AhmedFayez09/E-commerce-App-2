// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddToCartModel {
  final String id;
  final String title;
  final int price;
  final int quantity;
  final String imUrl;
  final int discountValue;
  final String color;
  final String size;
  final String productId;

  AddToCartModel({
    required this.productId,
    required this.id,
    required this.title,
    required this.price,
    this.quantity = 1,
    required this.imUrl,
    this.discountValue = 0,
    this.color = 'Black',
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'imUrl': imUrl,
      'discountValue': discountValue,
      'color': color,
      'size': size,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AddToCartModel(
      productId: map['productId'],
      id: documentId,
      title: map['title'],
      price: map['price'],
      quantity: map['quantity'],
      imUrl: map['imUrl'],
      discountValue: map['discountValue'],
      color: map['color'],
      size: map['size'],
    );
  }
}
