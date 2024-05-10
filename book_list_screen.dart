// book_list_screen.dart

import 'package:flutter/material.dart';
import 'package:kitap_okuma_uygulamasi/readed_books.dart';
import 'book.dart';
import 'book_details_screen.dart';


class BookListScreen extends StatefulWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Map<String, String>> books = [];
  List<ReadBook> readBooks = [];

  @override
  void initState() {
    super.initState();
    books.addAll([
      {'Baslik': 'Kitap 1', 'Kategori': 'Roman'},
      {'Baslik': 'Kitap 2', 'Kategori': 'Bilim Kurgu'},
      {'Baslik': 'Kitap 3', 'Kategori': 'Polisiye'},
    ]);
  }

  void okundulist(int index) {
    setState(() {
      // Okunan kitabın bilgilerini al
      ReadBook readBook = ReadBook(
        title: books[index]['Baslik'] ?? '',
        category: books[index]['Kategori'] ?? '',
      );

      // Okunan kitabı 'readBooks' dizisine ekle
      readBooks.add(readBook);

      // Kitabı 'books' dizisinden kaldır
      books.removeAt(index);
    });
  }

  void kitapsil(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  void _showEditDialog(Map<String, String> book, int index) {
    TextEditingController titleController =
        TextEditingController(text: book['Baslik']);
    TextEditingController categoryController =
        TextEditingController(text: book['Kategori']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kitap Düzenleme'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Kitap Adı'),
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Kategori'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Çikiş'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  books[index]['Baslik'] = titleController.text;
                  books[index]['Kategori'] = categoryController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Kaydet'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aylık Okuma Listesi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.assignment),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => readedbook(readBooks: readBooks)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              okundulist(index);
            },
            child: ListTile(
              title: Text(books[index]['Baslik'] ?? ''),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsScreen(
                      kategori: books[index]['Kategori'] ?? '',
                      kitapBasligi: books[index]['Baslik'] ?? '',
                    ),
                  ),
                );
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showEditDialog(books[index], index);
                    },
                    child: const Text('Düzenle'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      okundulist(index);
                    },
                    child: const Text('Okundu'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      kitapsil(index);
                    },
                    child: const Text('Sil'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add_book');
          if (result != null && result is Map<String, String>) {
            setState(() {
              books.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
