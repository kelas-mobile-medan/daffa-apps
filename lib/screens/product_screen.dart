import 'package:circlestyle/screens/arguments/shop_screen_arguments.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'shop_screen.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/product';

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Baju',
      'description': 'Product description here.',
      'price': 20.0,
      'image': 'assets/product_image.png',
      'rating': 4.5,
      'reviews': 56890,
    },
    {
      'name': 'Sepatu',
      'description': 'Another product description here.',
      'price': 15.0,
      'image': 'assets/product_image.png',
      'rating': 4.2,
      'reviews': 40230,
    },
    {
      'name': 'Tas',
      'description': 'Yet another product description.',
      'price': 25.0,
      'image': 'assets/product_image.png',
      'rating': 4.8,
      'reviews': 89500,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_pic.png'),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search any Product...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                '${products.length} Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: products.length,
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ShopScreen.routeName,
                        arguments: ShopScreenArguments(
                          productName: products[i]['name'],
                          productDescription: products[i]['description'],
                          productPrice: products[i]['price'],
                          productImage: products[i]['image'],
                          productRating: products[i]['rating'],
                          productReviews: products[i]['reviews'],
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.grey,
                            child: Image.asset(
                              products[i]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            products[i]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(products[i]['description']),
                          Text('₹${products[i]['price']}'),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Expanded(
                                child: Text(
                                  '${products[i]['rating']} (${products[i]['reviews']})',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
