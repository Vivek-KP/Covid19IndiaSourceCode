import 'package:flutter/material.dart';
import 'package:myweb/home%20.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:Home()
    );
  }
}

// // import 'dart:async';
// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;



// // void main() => runApp(MyApp());

// // class MyApp extends StatefulWidget {
// //   MyApp({Key? key}) : super(key: key);

// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   late Future<Album> futureAlbum;

// //   @override
// //   void initState() {
// //     super.initState();
// //     futureAlbum = fetchAlbum();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Fetch Data Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Fetch Data Example'),
// //         ),
// //         body: Center(
// //           child: FutureBuilder<Album>(
// //             future: futureAlbum,
// //             builder: (context, snapshot) {
// //               if (snapshot.hasData) {
// //               return '${snapshot.data!.total}';
// //               } else if (snapshot.hasError) {
// //                 return Text("${snapshot.error}");
// //               }

// //               // By default, show a loading spinner.
// //               return CircularProgressIndicator();
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<Album> fetchAlbum() async {
//   final response =
//       await http.get(Uri.https('api.covid19api.com', 'summary'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final int totalconfirmed;

//   Album({
//     required this.totalconfirmed
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       totalconfirmed: json['Countries'][76]["TotalConfirmed"],
//     );
//   }
// }

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text("${snapshot.data!.totalconfirmed}");
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

