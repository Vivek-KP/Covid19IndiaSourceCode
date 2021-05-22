import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:http/http.dart' as http;
import 'chart.dart';


class Graphdisplay extends StatefulWidget {
  @override
  _GraphdisplayState createState() => _GraphdisplayState();
}

class _GraphdisplayState extends State<Graphdisplay> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Graph>>(
      future: fetchAlbum(http.Client()),
      builder: (context,snapshot){
          if (snapshot.hasData) {
      return Activegraph(graph:snapshot.data!);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
      }
    );
  }
  
}
class Activegraph extends StatelessWidget{
  final Color red = Color(0xffff0000);
  final List<Graph>graph;

  Activegraph({Key?key,required this.graph}):super(key: key);
  
  final List<double> activeData = <double>[];

      

  @override
  Widget build(BuildContext context){
    return buildCardChart(graph);
    
  }
  Widget buildCardChart(List<Graph>graph){
    for (var item=(graph.length-300);item>=1; item--) {
      activeData.add(graph[graph.length-item].active.toDouble());
    }
    
    return Container(
      width:80,
    child:Sparkline(
      data:activeData,
      pointsMode: PointsMode.last,
      lineWidth: 3.0,
      pointSize:9,
      lineColor: red,
      pointColor:Colors.red)
    );    
    
  }
  
}





class Graphdisplay1 extends StatefulWidget {
  @override
  _Graphdisplay1State createState() => _Graphdisplay1State();
}

class _Graphdisplay1State extends State<Graphdisplay1> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Graph>>(
      future: fetchAlbum(http.Client()),
      builder: (context,snapshot){
          if (snapshot.hasData) {
      return Activegraph1(graph:snapshot.data!);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
      }
    );
  }
 
}
class Activegraph1 extends StatelessWidget{
  final List<Graph>graph;
  
  final Color green = Color(0xff00cc00);

  Activegraph1({Key?key,required this.graph}):super(key: key);
  
  final List<double> recoveredData = <double>[];

      

  @override
  Widget build(BuildContext context){
    return buildCardChart(graph);
    
  }
  Widget buildCardChart(List<Graph>graph){
    for (var item=(graph.length-300);item>=1; item--) {
      recoveredData.add(graph[graph.length-item].recovered.toDouble());
    }
    
    return Container(
      width:80,
    child:Sparkline(
      data:recoveredData,
      pointsMode: PointsMode.last,
      lineWidth: 3.0,
      pointSize:9,
      lineColor: green,
      pointColor:Colors.green
       )
    );   
    
  }
  
}




class Graphdisplay2 extends StatefulWidget {
  @override
  _Graphdisplay2State createState() => _Graphdisplay2State();
}

class _Graphdisplay2State extends State<Graphdisplay2> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Graph>>(
      future: fetchAlbum(http.Client()),
      builder: (context,snapshot){
          if (snapshot.hasData) {
      return Activegraph2(graph:snapshot.data!);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
      }
    );
  } 
}
class Activegraph2 extends StatelessWidget{
  final List<Graph>graph;
  final Color grey = Color(0xffe0e0e0);
  
  Activegraph2({Key?key,required this.graph}):super(key: key);
  
  final List<double> death = <double>[];

      

  @override
  Widget build(BuildContext context){
    return buildCardChart(graph);
    
  }
  Widget buildCardChart(List<Graph>graph){
    for (var item=(graph.length-300);item>=1; item--) {
      death.add(graph[graph.length-item].deaths.toDouble());
    }
    
    return Container(
      width:80,
    child:Sparkline(
      data:death,
      pointsMode: PointsMode.last,
      lineWidth: 3.0,
      pointSize:9,
      lineColor: grey,
      pointColor:Colors.grey )
    );
  }
  
}


class Graphdisplay3 extends StatefulWidget {
  @override
  _Graphdisplay3State createState() => _Graphdisplay3State();
}

class _Graphdisplay3State extends State<Graphdisplay3> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Graph>>(
      future: fetchAlbum(http.Client()),
      builder: (context,snapshot){
          if (snapshot.hasData) {
      return Activegraph3(graph:snapshot.data!);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
      }
    );
  }

  

  

  
}
class Activegraph3 extends StatelessWidget{
  final List<Graph>graph;
  final Color blue = Color(0xff03A1FE);
  Activegraph3({Key?key,required this.graph}):super(key: key);
  
  List<double> confirmData = <double>[];

      

  @override
  Widget build(BuildContext context){
    return buildCardChart(graph);
    
  }
  Widget buildCardChart(List<Graph>graph){
    for (var item=(graph.length-300);item>=1; item--) {
      confirmData.add(graph[graph.length-item].confirmed.toDouble());
    }
    
    return Container(
      width:80,
    child:Sparkline(
      data:confirmData,
      pointsMode: PointsMode.last,
      lineWidth: 3.0,
      pointSize:9,
      lineColor: blue,
      pointColor:Colors.blue )
    );
      
        
      
    
  }
  
}