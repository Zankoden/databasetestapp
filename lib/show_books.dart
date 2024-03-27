// import 'dart:convert';
// import 'package:databasetestapp/book_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ShowBooks extends StatefulWidget {
//   const ShowBooks({Key? key}) : super(key: key);

//   @override
//   _ShowBooksState createState() => _ShowBooksState();
// }

// class _ShowBooksState extends State<ShowBooks> {
//   List<dynamic> data = [];

//   Future<void> getData() async {
//     try {
//       var res = await http
//           .get(Uri.parse("http://10.0.2.2/practice_api/get_users.php"));
//       var response = jsonDecode(res.body);

//       if (response["success"] == true) {
//         setState(() {
//           data = response["data"];
//         });
//       } else {
//         print("Failed to retrieve data: ${response["message"]}");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Insert Record'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: ElevatedButton(
//               onPressed: () {
//                 getData();
//               },
//               child: const Text("Get Data"),
//             ),
//           ),

          // Expanded(
          //   child:GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       childAspectRatio: MediaQuery.of(context).size.width /
          //           (MediaQuery.of(context).size.height / 1),
          //       crossAxisCount: 3, // Adjust the number of items in a row
          //       crossAxisSpacing:
          //           20, // Adjust spacing between items horizontally
          //       mainAxisSpacing: 0, // Adjust spacing between items vertically
          //     ),
          //     itemCount: data.length,
          //     itemBuilder: (context, int index) {
          //       return SingleBookDisplay(
          //           bookName: bookName, imagePath: imagePath);
          //     },
          //   ),
          // ),
//         ],
//       ),
//     );
//   }
// }
