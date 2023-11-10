import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShopEx - Buy Bags"),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/logox.jpg',
                      width: 150, height: 150), // Add your app's icon image
                  SizedBox(height: 20),
                  Text(
                    "ShopEx - Buy Bags",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your one-stop shop for stylish bags!",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Version: 1.0.0",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Developed by YourCompany",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Description:",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "ShopEx is the ultimate destination for bag lovers. Discover a wide range of high-quality bags for every occasion.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Features:",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text(
                          "Browse and purchase a variety of bags.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text(
                          "Filter and search for bags based on your preferences.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text(
                          "Secure payment options for a hassle-free shopping experience.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text(
                          "Stay updated with the latest bag collections and promotions.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
