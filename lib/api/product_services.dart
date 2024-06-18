import 'package:circlestyle/model/product_model.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    // Dummy data untuk testing
    await Future.delayed(Duration(seconds: 2)); // Simulasi delay
    return [
      Product(
          name: 'Product 1',
          price: 29.99,
          imageUrl: 'https://via.placeholder.com/150'),
      Product(
          name: 'Product 2',
          price: 19.99,
          imageUrl: 'https://via.placeholder.com/150'),
    ];
  }
}
