import 'package:flutter_ecommerce/feature/ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/models/user_data.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/services/firestore_services.dart';
import '../../../core/utils/api_path.dart';

abstract class Database {
  Stream<List<ProductModel>> salesProductsStream();
  Stream<List<ProductModel>> newProductsStream();
  Future<void> setUserData(UserData userData);
}

class FirestoreDatabase implements Database {
  final _service = FireStoreServices.instance;
  final String uid;

  FirestoreDatabase(this.uid);

  @override
  Stream<List<ProductModel>> salesProductsStream() =>
      _service.collectionsStream(
          path: ApiPath.productColloctionName(),
          builder: (data, documentId) =>
              ProductModel.fromJson(data!, documentId),
          queryBuilder: (query) =>
              query.where('discountValue', isNotEqualTo: 0));

  @override
  Stream<List<ProductModel>> newProductsStream() => _service.collectionsStream(
        path: ApiPath.productColloctionName(),
        builder: (data, documentId) => ProductModel.fromJson(data!, documentId),
      );

  Future<void> setProduct(ProductModel product) async => _service.setData(
        path: '${ApiPath.productColloctionName()}${product.id}',
        data: product.toJson(),
      );

  @override
  Future<void> setUserData(UserData userData)async =>await _service.setData(
        path: ApiPath.user(userData.uid),
        data: userData.toMap(),
      );
}
