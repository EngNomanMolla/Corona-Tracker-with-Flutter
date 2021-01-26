import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
class FinalPage extends StatefulWidget {
  var totalCases;
  var todayCases;
  var country;
  var todayDeaths;
  var totalDeaths;
  var recover;
  FinalPage(this.totalCases,this.todayCases,this.country,this.todayDeaths,this.totalDeaths,this.recover);

  @override
  _FinalPageState createState() => _FinalPageState(totalCases,todayCases,country,todayDeaths,totalDeaths,recover);
}

class _FinalPageState extends State<FinalPage> {
  var totalCases;
  var todayCases;
  var country;
  var todayDeaths;
  var totalDeaths;
  var recover;
  _FinalPageState(this.totalCases,this.todayCases,this.country,this.todayDeaths,this.totalDeaths,this.recover);

var formatDate="";
  getCurrentDate() async{
    DateTime now= await new DateTime.now();
    String format=DateFormat('yMMMMd').format(now);
    setState(() {
      formatDate=format;
    });
  }

@override
  void initState() {
    getCurrentDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.redAccent,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white10,
                ),
              )
            ],
          ),Positioned(
            top: 40,
            left: 20,
            child: Text(formatDate,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight:FontWeight.bold),),

          ),
          Positioned(
            top: 63,
            left: 20,
            child: Text("Corona Virus Cases",style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.normal,

            ),),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Text(totalCases+"-World",style: TextStyle(
              fontSize:40,
              color: Colors.white38,
              fontWeight: FontWeight.normal,

            ),),
          ),

          Positioned(
            top: 160,
            left: 30,
            child: Container(
              padding: EdgeInsets.all(4.0),
              color: Colors.white,
              child: Text(country,style: TextStyle(
                fontSize:10,
                color: Colors.redAccent,
                fontWeight: FontWeight.normal,

              ),),
            ),
          ),
          
          Positioned(

            child: Container(
              margin: EdgeInsets.only(top:190),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left:20),
                              height:170,
                              width: MediaQuery.of(context).size.width/2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                elevation:4.0,
                                  child:Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Cases Today",style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.amber,
                                          ),),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(todayCases,style: TextStyle(
                                              fontSize:30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.amber,
                                          ),),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset("assets/linechart.svg",color: Colors.amber,),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right:20),
                              height:170,
                              width: MediaQuery.of(context).size.width/2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                elevation:4.0,
                                child:Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex:1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text("Deaths Today",style: TextStyle(
                                          fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                          color: Colors.red[300]
                                        ),),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(todayDeaths,style: TextStyle(
                                            fontSize:30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[300]
                                        ),),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child:SvgPicture.asset("assets/linechart.svg",color: Colors.red[300],),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ),

                          ],
                        ),
                      ),




                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 5),
                        width: MediaQuery.of(context).size.width,
                        height:170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          elevation: 4.0,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Total Cases",style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.amber[300],
                                              )),
                                            )
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child:Text(totalCases.toString(),style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber[300]
                                            ))
                                        )
                                      ],
                                    ),
                                  )

                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    child:SvgPicture.asset("assets/chart.svg"),
                                  ))
                            ],
                          ),
                        ),
                      ),








                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 5),
                        width: MediaQuery.of(context).size.width,
                        height:170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          elevation: 4.0,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Recover",style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green[300],
                                              )),
                                            )
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child:Text(recover.toString(),style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green[300]
                                            ))
                                        )
                                      ],
                                    ),
                                  )

                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    child:SvgPicture.asset("assets/stats.svg",),
                                  ))
                            ],
                          ),
                        ),
                      ),







                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 5),
                        width: MediaQuery.of(context).size.width,
                        height:170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          elevation: 4.0,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text("Total Deaths",style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red[300],
                                              )),
                                            )
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child:Text(totalDeaths.toString(),style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red[300]
                                            ))
                                        )
                                      ],
                                    ),
                                  )

                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    child:SvgPicture.asset("assets/firstchart.svg",),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,)

                    ],
                  ),

                ),
              ),
            ),
          )
        ],

      )
    );
  }



}
