import 'package:flutter/material.dart';
import 'electricity_cost_screen.dart';
import 'user_screen.dart'; // Kullanıcı ekranını içeren dosya

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GüneşPlan Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ElectricityCostScreen(),
    Container(), // Boş bir widget, diğer sayfaları temsil eder
    UserScreen(), // Kullanıcı ekranı
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Konum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Kullanıcı',
          ),
        ],
      ),
    );
  }
}
