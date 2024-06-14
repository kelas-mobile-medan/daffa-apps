import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Personal Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            buildTextField('Email Address', 'daffaafdallah11@gmail.com'),
            buildTextField('Password', '', isPassword: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add password change logic here
                },
                child: Text('Change Password'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Business Address Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            buildTextField('Pincode', '450116'),
            buildTextField('Address', 'Paya Jambu Pasar 5.'),
            buildTextField('City', 'Langkat'),
            buildTextField('State', 'Sumatera Utara'),
            buildTextField('Country', 'Indonesia'),
            SizedBox(height: 16),
            Text(
              'Bank Account Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            buildTextField('Bank Account Number', '204356XXXXXXXX'),
            buildTextField('Account Holder\'s Name', 'Daffa Ikhsan Afdallah'),
            buildTextField('IFSC Code', 'SBIN00428'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add save logic here
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF00426D),
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
