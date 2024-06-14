import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';

class ShopScreen extends StatelessWidget {
  static const routeName = '/shop';

  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImage;
  final double productRating;
  final int productReviews;

  ShopScreen({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.productRating,
    required this.productReviews,
  });

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        CartScreen.routeName,
                        arguments: CartScreenArguments(
                          productName: productName,
                          productPrice: productPrice,
                          productImage: productImage,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      productImage,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      productName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text('$productRating ($productReviews)'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '₹${productPrice * 2}  ₹$productPrice',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '₹$productPrice',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(productDescription),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            CartScreen.routeName,
                            arguments: CartScreenArguments(
                              productName: productName,
                              productPrice: productPrice,
                              productImage: productImage,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF00426D), // Text color
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Add To Cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
