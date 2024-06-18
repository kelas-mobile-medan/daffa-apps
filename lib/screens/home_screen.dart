import 'dart:io';
import 'package:circlestyle/screens/product_screen.dart';
import 'package:circlestyle/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemNavigator.pop()

class HomePage extends StatelessWidget {
  static const routeName = '/home';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProductScreen.routeName);
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
                        Navigator.pushNamed(context, ProfileScreen.routeName);
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
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '50-40% OFF',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text('Now in (product)\nAll colours'),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ProductScreen.routeName);
                            },
                            child: Text('Shop Now'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF00426D),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/shopping_bags.png',
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Promo of the Day',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('22h 55m 20s remaining'),
                          TextButton(
                            onPressed: () {},
                            child: Text('View all'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF00426D),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
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
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Baju',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Description'),
                            Text('₹20 40% OFF'),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text('5.0 (56890)'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
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
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Tas',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Description'),
                            Text('₹24 50% OFF'),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text('5.0 (344567)'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
