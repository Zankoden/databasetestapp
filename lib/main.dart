import 'dart:convert';

// import 'package:databasetestapp/show_books.dart';
// import 'package:databasetestapp/test.dart';
import 'package:databasetestapp/test_page2.dart';
import 'package:databasetestapp/test_page3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TestPage3(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertRecord() async {
    if (name.text != "" && email.text != "" && password.text != "") {
      try {
        String uri = "http://10.0.2.2/practice_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "password": password.text,
        });

        var response = jsonDecode(res.body);
        if (response["success"] == true) {
          print("Record Inserted");
        } else {
          print("Some issues");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Fill all field");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Record'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter the name"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter the email"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter the password"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  insertRecord();
                },
                child: const Text("Insert")),
          )
        ],
      ),
    );
  }
}
