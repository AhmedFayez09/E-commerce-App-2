class ApiPath {
  static String productColloctionName() => 'products/';
  static String user(String uid) => 'users/$uid';
  static String addToCart(String uid, String addToCartId) =>
      'users/$uid/cart/$addToCartId';
  static String myProductsCart(String uid) => 'users/$uid/cart/';
}
