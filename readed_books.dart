import 'package:flutter/material.dart';
import 'package:kitap_okuma_uygulamasi/book.dart';

// ignore: camel_case_types
class readedbook extends StatefulWidget {
  final List<ReadBook> readBooks;

  const readedbook({Key? key, required this.readBooks}) : super(key: key);

  @override
  State<readedbook> createState() => _readedbookState();
}

// ignore: camel_case_types
class _readedbookState extends State<readedbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Okunan Kitaplar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
  itemCount: widget.readBooks.length ?? 0,
  itemBuilder: (context, index) {
    if (widget.readBooks.isNotEmpty) {
      return ListTile(
        title: Text(widget.readBooks[index].title),
        subtitle: Text(widget.readBooks[index].category),
      );
    } else {
      return const ListTile(
        title: Text(''),
        subtitle: Text(''),
      );
    }
  },
),

    );
  }
}
