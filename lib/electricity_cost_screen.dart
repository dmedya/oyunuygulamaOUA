import 'package:flutter/material.dart';
import 'report_screen.dart'; // Rapor sayfasını içeren dosya

class ElectricityCostScreen extends StatelessWidget {
  final TextEditingController costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elektrik Maliyeti'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Vector.png', // Üstteki logo görseli
                    height: 50.0,
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
            Text(
              'Elektriği yoğun kullandığınız zamanı seçiniz.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                children: [
                  _buildGridTile('SABAH\n06:00-12:00', 15, 15),
                  _buildGridTile('ÖĞLE\n12:00-18:00', 15, 15),
                  _buildGridTile('AKŞAM\n18:00-06:00', 30, 15),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Aylık elektrik faturanızı seçiniz.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: costController,
              decoration: InputDecoration(
                labelText: 'Bedel miktarını giriniz',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('Faturamın tamamını karşılamak istiyorum'),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Hesaplama işlemleri burada yapılabilir
                  double cost = double.parse(costController.text);
                  double power = calculatePower(cost); // Gücü hesapla (örnek)
                  double production = calculateProduction(cost); // Üretimi hesapla (örnek)
                  // Diğer hesaplamalar...

                  // Rapor sayfasına yönlendirme
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportPage(
                        city: 'Elazığ', // Örnek şehir
                        power: power,
                        production: production,
                        panel: 4, // Örnek panel sayısı
                        cost: 54985, // Örnek maliyet
                        energy: 1491, // Örnek satılabilir enerji
                        payback: 7.7, // Örnek geri ödeme süresi
                      ),
                    ),
                  );
                },
                child: Text('Hesapla'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridTile(String title, double width, double height) {
    return Container(
      height: height * 10, // Height multiplied by 10
      width: width * 10,   // Width multiplied by 10
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [Colors.green, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  double calculatePower(double cost) {
    // Güç hesaplama mantığı
    return cost / 300.0;
  }

  double calculateProduction(double cost) {
    // Üretim hesaplama mantığı
    return cost * 1.5;
  }
}
