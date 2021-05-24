import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';


Future<List<Tested>> fetch(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.covid19india.org/data.json'));
  
  return compute(parsePhotos, response.body);
  
}
List<Tested>parsePhotos(String responsebody){
 final parsed = jsonDecode(responsebody)['tested'].cast<Map<String,dynamic>>();
 return parsed.map<Tested>((json)=>Tested.fromJson(json)).toList();
}
class Tested {
  final String totaldosesadministered;
  


  Tested({
    
    required this.totaldosesadministered,

  });

  factory Tested.fromJson(Map<String, dynamic> json) {
    return Tested(
    
      totaldosesadministered: json['totaldosesadministered'] as String,
     
    );
  }
}


class Distested extends StatefulWidget {
  @override
  _DistestedState createState() => _DistestedState();
}

class _DistestedState extends State<Distested> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tested>>(
      future: fetch(http.Client()),
      builder:(context,snapshot){
          if (snapshot.hasData) {
      return Displaytest(testedcase:snapshot.data!);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
      } );
      
    
  }
  

}
class Displaytest extends StatelessWidget{
  final List<Tested>testedcase;
  final Color font = Color(0xffFC6802);
  Displaytest({Key?key,required this.testedcase}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text("${testedcase[testedcase.length-1].totaldosesadministered}",style:TextStyle(
        color:font,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ))
    );
  }
}





