// book_details_screen.dart
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  final String kategori;
  final String kitapBasligi;

  const BookDetailsScreen({
    Key? key,
    required this.kategori,
    required this.kitapBasligi,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late String kategori;
  late String kitapBasligi;

  @override
  void initState() {
    super.initState();
    kategori = widget.kategori;
    kitapBasligi = widget.kitapBasligi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Kitap Detayları'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori: $kategori',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Kitap Başlığı: $kitapBasligi',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
