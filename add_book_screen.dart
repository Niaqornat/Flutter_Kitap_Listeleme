// add_book_screen.dart
import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  TextEditingController bookController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitap Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: bookController,
              decoration: const InputDecoration(labelText: 'Kitap Adı'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Kategori'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String newBook = bookController.text;
                String newCategory = categoryController.text;

                if (newBook.isNotEmpty && newCategory.isNotEmpty) {
                  Navigator.pop(
                    context,
                    {'Baslik': newBook, 'Kategori': newCategory},
                  );
                } else {
                  // Uyarı: Kitap adı ve kategori boş olmamalı
                }
              },
              child: const Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
