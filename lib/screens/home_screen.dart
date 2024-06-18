import 'dart:io';
import 'package:circlestyle/screens/product_screen.dart';
import 'package:circlestyle/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemNavigator.pop()
import 'package:circlestyle/services/api_services.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool confirmExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure you want to leave?'),
            content: Text('Pressing Yes will exit the app.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // No, don't exit
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
        return confirmExit;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
        body: FutureBuilder<List<dynamic>>(
          future: apiService.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final products = snapshot.data!;
              return SingleChildScrollView(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductScreen.routeName);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF00426D),
                                  radius: 24,
                                  child: Text(
                                    'A',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text('All Product'),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF00426D),
                                radius: 24,
                                child: Text(
                                  'C',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Checkout'),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProfileScreen.routeName);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF00426D),
                                  radius: 24,
                                  child: Text(
                                    'P',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text('Profile'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ...products.map((product) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
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
                                height: 80,
                                color: Colors.grey,
                                child: Image.network(
                                  product['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                product['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(product['description']),
                              Text(
                                  '₹${product['price']} ${product['discount']}% OFF'),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Text(
                                      '${product['rating']} (${product['reviews']})'),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
