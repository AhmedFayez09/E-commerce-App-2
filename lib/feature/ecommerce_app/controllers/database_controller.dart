import 'package:flutter_ecommerce/feature/ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce/feature/ecommerce_app/services/firestore_services.dart';

abstract class Database {
  Stream<List<ProductModel>> productsStream();
}

class FirestoreDatabase implements Database {
  final _service = FireStoreServices.instance;

  @override
  Stream<List<ProductModel>> productsStream() => _service.collectionsStream(
        path: 'product/',
        builder: (data, documentId) => ProductModel.fromJson(data!, documentId),
      );
}




















































