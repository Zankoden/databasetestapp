import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'book_widget.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({super.key});

  @override
  State<TestPage3> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1),
                crossAxisCount: 3, // Adjust the number of items in a row
                crossAxisSpacing:
                    20, // Adjust spacing between items horizontally
                mainAxisSpacing: 0, // Adjust spacing between items vertically
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return SingleBookDisplay(
                  bookName: books[index]["BookName"],
                  imagePath: books[index]["BookImagePath"],
                );
              },
            ),
          ),

//
        ],
      ),
    );
  }
}
