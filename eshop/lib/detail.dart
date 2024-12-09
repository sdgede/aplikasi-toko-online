import 'package:flutter/material.dart';

// Halaman Detail Produk
class DetailPage extends StatelessWidget {
  final String image;
  final String text;
  final String description;
  final String harga;

  const DetailPage({
    super.key,
    required this.image,
    required this.text,
    required this.description,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(image, width: 250, height: 250, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              harga,
              style: TextStyle(color: Colors.grey[600], fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
