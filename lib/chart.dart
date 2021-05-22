import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


Future<List<Graph>> fetchAlbum(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.covid19api.com/total/dayone/country/india'));
  
  return compute(parsePhotos, response.body);
  
}
List<Graph>parsePhotos(String responsebody){
 final parsed = jsonDecode(responsebody).cast<Map<String,dynamic>>();
 return parsed.map<Graph>((json)=>Graph.fromJson(json)).toList();
}
class Graph {
  final int active;
  final int confirmed;
  final int recovered;
  final int deaths;
  final DateTime date;
  


  Graph({
    required this.active,
    required this.confirmed,
    required this.recovered,
    required this.deaths,
    required this.date,
  });

  factory Graph.fromJson(Map<String, dynamic> json) {
    return Graph(
      active: json['Active'] as int,
      confirmed: json['Confirmed'] as int,
      recovered: json['Recovered'] as int,
      deaths: json['Deaths'] as int,
      date:DateTime.parse(json['Date']),
      
    );
  }
}


