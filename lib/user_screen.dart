import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Vector.png', // Üstteki logo görseli
                    height: 50.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'GüneşPlan Pro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            onTap: () {
              // Anasayfa'ya yönlendirme
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Dijital Kimlik'),
            onTap: () {
              // Dijital Kimlik sayfasına yönlendirme
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('İletişim'),
            onTap: () {
              // İletişim sayfasına yönlendirme
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış'),
            onTap: () {
              // Çıkış işlemleri
            },
          ),
        ],
      ),
    );
  }
}

