import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final String city;
  final double power;
  final double production;
  final int panel;
  final double cost;
  final double energy;
  final double payback;

  ReportPage({
    required this.city,
    required this.power,
    required this.production,
    required this.panel,
    required this.cost,
    required this.energy,
    required this.payback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tahmini Sonuçlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildResultRow('Şehir', city),
            buildResultRow('Güç', '$power kWp'),
            buildResultRow('Üretim', '$production kWh'),
            buildResultRow('Panel', panel.toString()),
            buildResultRow('Maliyet', '$cost₺'),
            buildResultRow('Satılabilir Enerji', '$energy₺'),
            buildResultRow('Geri Ödeme', '$payback yıl'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Konum'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Kullanıcı'),
        ],
      ),
    );
  }

  Widget buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
