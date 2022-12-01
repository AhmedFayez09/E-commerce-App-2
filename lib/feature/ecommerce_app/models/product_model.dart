import 'package:flutter_ecommerce/core/utils/app_strings/images_path.dart';

class ProductModel {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final double? rate;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.category = 'Other',
    this.rate,
  });

  Map<String ,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'price':price,
      'imgUrl':imgUrl,
      'discountValue':discountValue,
      'category':category,
      'rate':rate,
    };
  }




  factory ProductModel.fromJson(Map<String, dynamic> map, String documentId) {
    return ProductModel(
      id: documentId,
      title: map['title'],
      price: map['price'],
      imgUrl: map['imgUrl'],
      discountValue: map['discountValue'],
      category: map['category'],
      rate: map['rate'],
    );
  }
}

List<ProductModel> dummyProducts = [
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets2,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imgUrl: AppImagesPathNetwork.tempProductAssets1,
      category: 'Clothes',
      discountValue: 20),
];
