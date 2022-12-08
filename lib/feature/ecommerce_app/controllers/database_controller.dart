import 'package:flutter_ecommerce/core/utils/app_strings/app_strings.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/services/firestore_services.dart';

abstract class Database {
  Stream<List<ProductModel>> salesProductsStream();
  Stream<List<ProductModel>> newProductsStream();
}

class FirestoreDatabase implements Database {
  final _service = FireStoreServices.instance;
  final String uid;

  FirestoreDatabase(this.uid);

  @override
  Stream<List<ProductModel>> salesProductsStream() =>
      _service.collectionsStream(
          path: '${AppStrings.productColloctionName()}/',
          builder: (data, documentId) =>
              ProductModel.fromJson(data!, documentId),
          queryBuilder: (query) =>
              query.where('discountValue', isNotEqualTo: 0));

  @override
  Stream<List<ProductModel>> newProductsStream() => _service.collectionsStream(
        path: '${AppStrings.productColloctionName()}/',
        builder: (data, documentId) => ProductModel.fromJson(data!, documentId),
      );

  Future<void> setProduct(ProductModel product) async => _service.setData(
        path: '${AppStrings.productColloctionName()}/${product.id}',
        data: product.toJson(),
      );
}
