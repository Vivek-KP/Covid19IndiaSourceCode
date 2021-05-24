
import 'package:flutter/material.dart';
import 'package:myweb/extra.dart';
import 'data.dart';
import 'table.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin{
  // late Future<Album> futureAlbum;
  // late Future<List<CountrySummaryModel>>summaryList;
late AnimationController controller;
  late Animation<double> animation;

  Color hexcolor = Color(0xff181723);
  Color hex = Color(0xffECF0F1);
  Color black = Color(0xff333333);
  Color black1=  Color(0xff808080);
  Color red = Color(0xffff0000);
  Color font = Color(0xff979A9C);
  Color cov = Color(0xff0501FB );
  final Color vac = Color(0xffFC6802);


  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCubic,
    ).drive(Tween(begin: 0, end: 2));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: black,
      child: Row(
        children: [
          Container(
            color: black,
            width: 83,
            height: MediaQuery.of(context).size.height*1,

            child:ListView(
              children:[ Column(
                children: [
                  Column(
                    children: [
                    Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                
                color: Colors.black87,
                    child: 
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        
                        onTap: () {
                        controller
                          ..reset()
                          ..forward();
                      },
                        child: RotationTransition(
                          turns: animation,
                          child: Icon(Icons.anchor,
                          color: Colors.white,
                          ),
                        ),
                      )
                      
                      ,
                    ),
                
                                  ),
                                ),
              
            
                  SizedBox(
                    height: 5,
                  ),
                      Text("COVID19",style: TextStyle(color:Colors.white,fontSize: 16),),
                      Text("INDIA",style:TextStyle(color:Colors.lightBlue),)
                    ],
                  ),
                // Padding(padding: EdgeInsets.only(top: 100)),
                // buttons(Icons.home,"Home"),
                //  buttons(Icons.search,"search"),
                //   buttons(Icons.search,"search"),
                ],
              ),
              ],
            )
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*1,
              decoration: BoxDecoration(
                color:hexcolor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                        Container(
                        width: MediaQuery.of(context).size.width*1,
                         height: MediaQuery.of(context).size.height*.14,
                         decoration: BoxDecoration(
                color:hexcolor,
                boxShadow: [
                BoxShadow(
                  color:hexcolor,
                
                  
                )
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
              ),
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
             Text("INDIA",style:TextStyle(
                           color: red,
                           fontWeight: FontWeight.bold,
                           fontSize: 26,
                          letterSpacing: 2
                           ),),
                         Row(
                            children: [
                              Text("Last updated:",style: TextStyle(color: font,)),
                              FutureBuilder<List<Album>>(
                                future: fetchAlbum(http.Client()),
                                builder: (context,snapshot){
                                   if (snapshot.hasData) {
                                return Photo2(album:snapshot.data!);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              // By default, show a loading spinner.
                              return CircularProgressIndicator();
                                }
                              ),
                            ],
                          ),
                        
                      ],
                    ),
                     Column(
                          children: [
                             Row(
                               children: [
                                 Icon(Icons.shield_outlined,color:vac),
                                 SizedBox(width: 1),
                                 Text("Vaccinated",style: TextStyle(color:vac,fontSize: 16),),
                               ],
                             ),
                            Distested()
                          ],
                        ),
                  ],
                ),
              )
                        ),
                  
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FutureBuilder<List<Album>>(
            future: fetchAlbum(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Photol(album:snapshot.data!);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
                      ),
                      SizedBox(height: 5,),
           FutureBuilder<List<Album>>(
            future: fetchAlbum(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Dtable(album: snapshot.data!);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
                    ],
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),
      ),
      );
  
  }

}


