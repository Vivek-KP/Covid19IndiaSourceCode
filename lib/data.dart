import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:myweb/linegraph.dart';


Future<List<Album>> fetchAlbum(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.covid19india.org/data.json'));
  
  return compute(parsePhotos, response.body);
  
}
List<Album>parsePhotos(String responsebody){
 final parsed = jsonDecode(responsebody)['statewise'].cast<Map<String,dynamic>>();
 return parsed.map<Album>((json)=>Album.fromJson(json)).toList();
}
class Album {
  final String active;
  final String confirmed;
  final String recovered;
  final String deaths;
  final String date;
  final String newconfirm;
  final String newrecover;
  final String newdeath;
  final String state;


  Album({
    required this.active,
    required this.confirmed,
    required this.recovered,
    required this.deaths,
    required this.date,
    required this.newconfirm,
    required this.newrecover,
    required this.newdeath,
    required this.state
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      active: json['active'] as String,
      confirmed: json['confirmed'] as String,
      recovered: json['recovered'] as String,
      deaths: json['deaths'] as String,
      date:json['lastupdatedtime'] as String,
      newconfirm:json['deltaconfirmed'] as String,
      newrecover:json['deltarecovered'] as String,
      newdeath:json['deltadeaths'] as String,
      state: json['state'] as String
    );
  }
}



class Photo2 extends StatelessWidget{
  final List<Album>album;
  final Color font = Color(0xff979A9C);
  Photo2({Key?key,required this.album}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text("${album[0].date}",style:TextStyle(
        color:font,
      ))
    );
  }
}

class Photol extends StatelessWidget{
  final Color red = Color(0xffff0000);
  final Color green = Color(0xff00cc00);
  final Color blue = Color(0xff03A1FE);
  final Color grey = Color(0xffe0e0e0);
  final Color hexcolor = Color(0xff1C1935);
  final List<Album>album;
  final List<double> svalue = <double>[];

  Photol({Key?key,required this.album}):super(key: key);


  @override
  Widget build(BuildContext context) {
    svalue.add(double.parse(album[0].active));
    svalue.add(double.parse(album[0].confirmed));
    svalue.add(double.parse(album[0].recovered));
    svalue.add(double.parse(album[0].deaths));

    MoneyFormatterOutput activecase = FlutterMoneyFormatter(
    amount:svalue[0]
).output;
  MoneyFormatterOutput confirmedcases = FlutterMoneyFormatter(
    amount:svalue[1]
).output;
  MoneyFormatterOutput recoveredcase = FlutterMoneyFormatter(
    amount:svalue[2]
).output;
  MoneyFormatterOutput deathscase = FlutterMoneyFormatter(
    amount:svalue[3]
).output;





    return Wrap(
      direction: Axis.horizontal,
        children: [
          Card(
            shadowColor: Colors.black,
            color:hexcolor,
            child:
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
               
               children: [
                 Padding(
                   padding: const EdgeInsets.only(bottom:8),
                   child: Text("Active",style: TextStyle(
                     color: red,
                     fontWeight: FontWeight.bold,
                     fontSize: 16
                     ),
                     ),
                 ),
                 Padding(
             padding: const EdgeInsets.all(8.0),
             child:
                 Text('+${album[0].newconfirm}',style: 
                          TextStyle(color: red),)
           ),
          Text("${activecase.withoutFractionDigits}",style: TextStyle(
            color: red,
            fontWeight: FontWeight.bold,
            fontSize: 22
            ),),
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: Graphdisplay(),
            )
               ],
             ),
           )),
              Card(
                color:hexcolor,
            shadowColor: Colors.black,
            child:
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
               
               children: [
                 Padding(
                   padding: const EdgeInsets.only(bottom:8),
                   child: Text("Confirmed",style: TextStyle(
                     color: blue,
                     fontWeight: FontWeight.bold,
                     fontSize: 16
                     ),
                     ),
                 ),
                 
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text("${confirmedcases.withoutFractionDigits}",style: TextStyle(
              color: blue,
              fontWeight: FontWeight.bold,
               fontSize: 22
              ),),
          ),
          Padding(padding: EdgeInsets.only(top: 15),
           child: Graphdisplay3(),)
               ],
             ),
           )),
              Card(
                color:hexcolor,
            shadowColor: Colors.black,
            child:
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
               
               children: [
                 Padding(
                   padding: const EdgeInsets.only(bottom:8),
                   child: Text("Recoverd",style: TextStyle(
                     color: green,
                     fontWeight: FontWeight.bold,
                     fontSize: 16
                     ),
                     ),
                 ),
                 Padding(
             padding: const EdgeInsets.all(8.0),
             child:
                 Text('+${album[0].newrecover}',style: 
                          TextStyle(color: green),)
           ),
          Text("${recoveredcase.withoutFractionDigits}",style: TextStyle(
            color: green,
            fontWeight: FontWeight.bold,
             fontSize: 22
            ),),
            Padding(padding: EdgeInsets.only(top: 15),
            child: Graphdisplay1(),)
               ],
             ),
           )
           ),
              Card(
                color:hexcolor,
            shadowColor: Colors.black,
            child:
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
               
               children: [
                 Padding(
                   padding: const EdgeInsets.only(bottom:8),
                   child: Text("Decease",style: TextStyle(
                     color: grey,
                     fontWeight: FontWeight.bold,
                     fontSize: 16
                     ),
                     ),
                 ),
                 Padding(
             padding: const EdgeInsets.all(8.0),
             child:
                 Text('+${album[0].newdeath}',style: 
                          TextStyle(color:grey),)
           ),
          Text("${deathscase.withoutFractionDigits}",
          style: TextStyle(
            color: grey,
            fontWeight: FontWeight.bold,
             fontSize: 22
            ),),
           Padding(padding: EdgeInsets.only(top: 15),
           child: Graphdisplay2(),)
               ],
             ),
           )),

        ],
      
    );
    
  }

}

