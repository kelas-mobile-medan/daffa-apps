class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  // Pastikan untuk membuat factory method jika Anda menginisialisasi dari JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: (json['price'] as num).toDouble(), // Mengubah ke double
      imageUrl: json['imageUrl'],
    );
  }
}
