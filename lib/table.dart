import 'package:flutter/material.dart';
import 'data.dart';



class Dtable extends StatelessWidget {

  final Color font = Color(0xff979A9C);
  final Color red = Color(0xffff0000);
  final Color green = Color(0xff00cc00);
  final Color blue = Color(0xff03A1FE);
  final Color grey = Color(0xffe0e0e0);
  final List<Album>album;
  Dtable({Key?key,required this.album}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        showBottomBorder:true,
        dividerThickness:3,
        headingTextStyle: TextStyle(
          color: font,
          fontWeight: FontWeight.bold,
          fontSize:17,
          fontStyle: FontStyle.italic
        ),
        dataTextStyle: TextStyle(
          color:font
        ),
        columns: [
          DataColumn(label: Text("State/UT")),
          DataColumn(label: Text("Confirmed"),numeric: true,onSort: (i,b){
          }),
          DataColumn(label: Text("Active"),numeric: true),
          DataColumn(label: Text("Recovered"),numeric:true),
          DataColumn(label: Text("Deceased"),numeric: true)
        ], rows: [
          Datavaluesin(1),
          Datavaluesin(2),
          Datavaluesin(3),
          Datavaluesin(4),
          Datavaluesin(5),
          Datavaluesin(6),
          Datavaluesin(7),
          Datavaluesin(8),
          Datavaluesin(9),
          Datavaluesin(10),
          Datavaluesin(11),
          Datavaluesin(12),
          Datavaluesin(13),
          Datavaluesin(14),
          Datavaluesin(15),
          Datavaluesin(16),
          Datavaluesin(17),
          Datavaluesin(18),
          Datavaluesin(19),
          Datavaluesin(20),
          Datavaluesin(21),
          Datavaluesin(22),
          Datavaluesin(23),
          Datavaluesin(24),
          Datavaluesin(25),
          Datavaluesin(26),
          Datavaluesin(27),
          Datavaluesin(28),
          Datavaluesin(29),
          Datavaluesin(30),
          Datavaluesin(32),
          Datavaluesin(33),
          Datavaluesin(34),
          Datavaluesin(35),
          Datavaluesin(36),
          Datavaluesin(37),
        ]),
    );
    
  }

  DataRow Datavaluesin(int i) {
    return DataRow(
      
          cells: [
          DataCell(Text("${album[i].state}"),),
          DataCell(Text("${album[i].confirmed}")),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(album[i].newconfirm!='0')
              Text("+${album[i].newconfirm}",style: TextStyle(color: red),),
              Text("${album[i].active}"),
            ],
          )),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              if(album[i].newrecover!='0')
              Text("+${album[i].newrecover}",style: TextStyle(color: green,),),
              Text("${album[i].recovered}"),
            ],
          )),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              if(album[i].newdeath!='0')
              Text("+${album[i].newdeath}",style: TextStyle(color: grey),),
              Text("${album[i].deaths}"),
            ],
          )),
        ],
        
        );
  }
}

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<List<Album>> fetchAlbum(http.Client client) async {
//   final response =
//       await client.get(Uri.parse('https://api.covid19india.org/data.json'));
  
//   return compute(parsePhotos, response.body);
  
// }
// List<Album>parsePhotos(String responsebody){
//  final parsed = jsonDecode(responsebody)['cases_time_series'].cast<Map<String,dynamic>>();
//  return parsed.map<Album>((json)=>Album.fromJson(json)).toList();
// }
// class Album {

//   final String totalconfirmed;
  
//   Album({
//     required this.totalconfirmed,
  
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
    
//       totalconfirmed: json['totalconfirmed']as String,
      
//     );
//   }
// }
// class Photol2 extends StatelessWidget{
//   Color red = Color(0xffff0000);
//   Color green = Color(0xff00cc00);
//   Color blue = Color(0xff03A1FE);
//   Color grey = Color(0xff8B8B8B);
//   Color hexcolor = Color(0xff1C1935);
  

//   final List<Album>album;
//   Photol2({Key?key,required this.album}):super(key: key);

 
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("${album[album.length-1].totalconfirmed}"),
//     );
//   }}