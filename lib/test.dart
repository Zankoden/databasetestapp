import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<dynamic> data = [];

  Future<void> getData() async {
    try {
      var res = await http
          .get(Uri.parse("http://10.0.2.2/practice_api/get_users.php"));
      var response = jsonDecode(res.body);

      if (response["success"] == true) {
        setState(() {
          data = response["data"];
        });
      } else {
        print("Failed to retrieve data: ${response["message"]}");
      }
    } catch (e) {
      print(e);
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
            child: ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text("Get Data"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]["uname"]),
                  subtitle: Text(data[index]["uemail"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
