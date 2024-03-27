import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<Map<String, dynamic>> books = [];

  Future<void> getBooks() async {
    try {
      var res = await http
          .get(Uri.parse("http://10.0.2.2/practice_api/get_my_books.php"));
      var response = jsonDecode(res.body);

      print("Raw Response: $response");

      if (response is List) {
        setState(() {
          books = List.from(response);
        });
      } else {
        print("Failed to retrieve books: Invalid response format");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Books'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                getBooks();
              },
              child: const Text("Get Books"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(books[index]["BookName"]),
                  subtitle: Image.asset(books[index]["BookImagePath"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
