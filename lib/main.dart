import 'dart:convert';

import 'package:covid_2010/FinalPage.dart';
import 'package:covid_2010/ModelClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:covid_2010/StartPage.dart';

void main(){
  runApp(
    MaterialApp(
      title: "title",
      home: StartPage(),
      debugShowCheckedModeBanner: false,
    )
  );
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  List<ModelClass> list=[];
  List<ModelClass> unfilterList=[];
  List<ModelClass> takeWorldCases=[];
  var loading=false;
  var _value="";
  var _country;
  var txt=TextEditingController();

  Future<Null> fetchData()async{
    setState(() {
      loading=true;
    });
   final response=await http.get("https://coronavirus-19-api.herokuapp.com/countries/");
   if(response.statusCode==200){
      var data=jsonDecode(response.body);
      setState(() {
        for(Map i in data){
          list.add(new ModelClass.fromJson(i));

        }
        this.unfilterList=list;
        this.takeWorldCases=list;
        loading=false;
      });
   }


  }
//Start Search Data
  searchData(){
    var _strLength=_value.length>0?true:false;
    if(_strLength){
      List<ModelClass> filterData=[];

      for(int i=0;i<unfilterList.length;i++){

        if(unfilterList[i].country.toUpperCase().contains(_value.toUpperCase())){
          filterData.add(unfilterList[i]);
        }
      }
      setState(() {
        this.list=filterData;
      });
    }
    else{
      setState(() {
        this.list=this.unfilterList;
      });

    }
  }


  //Start Store Data

  storeData() async{
    SharedPreferences sh=await SharedPreferences.getInstance();
    setState(() {
      sh.setString("country",_value );
    });

  }


  readData()async{
    SharedPreferences sh=await SharedPreferences.getInstance();
    String country= sh.getString("country");
    setState(() {
    _country=country;

    });
  }



   @override
  void initState() {
    fetchData();
    super.initState();
  }

  List<Widget>_getItems(){

    List<Card>_cards=[];
    int length=0;
     if(list.length==null){
     return _cards;
     }
     else{
       setState(() {
         length=list.length;
       });
     }
    for(int i=0;i<length;i++){
      _cards.add(Card(
        child: ListTile(
          leading: CircleAvatar(child: Icon(Icons.ac_unit),),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text(list[i].country.toUpperCase(),style: TextStyle(letterSpacing: 3),),
          onTap:(){
            String totalCases=takeWorldCases[0].cases.toString();
            String todayCase=list[i].todayCases.toString();
            String country=list[i].country.toString();
            String todayDeaths=list[i].todayDeaths.toString();
            String totalDeaths=list[i].deaths.toString();
            String recover=list[i].recovered.toString();


            Route route=MaterialPageRoute(builder: (context)=>FinalPage(totalCases,todayCase,country,todayDeaths,totalDeaths,recover));
            Navigator.push(context, route);
          }
          ,),
      ));
    }
    return _cards;
  }

  alertDialoge(var context)async{
    txt.text=_country;
    return showDialog(context: context,
    builder: (context){
      return new Dialog(
        child: Container(
          height: 130,
          child: Column(
            children: <Widget>[
              Container(
                padding:EdgeInsets.all(10),
                child: TextField(
                  controller:txt ,
                  decoration: InputDecoration(
                    hintText: "Search Country..",

                  ),
                  onChanged:(value){
                    setState(() {
                      _value=value;
                    });
                    searchData();
                  },
                ),

              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Text("Ok"),
                  onPressed: (){
                    storeData();
                    Navigator.pop(context);
                  },

                ),
              )
            ],
          ),
        ),

      );
    },
    barrierDismissible: false,
    );

  }
  conformDialoge(){
    showDialog(context: context,
    builder: (context){
      return new AlertDialog(
        title: Text("Alert!"),
        content: Text("Are you sure to exit?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes"),
            onPressed: (){
              SystemNavigator.pop();
            },
          ),
          FlatButton(
            child: Text("No"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],

      );
    },
    barrierDismissible:false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        conformDialoge();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          onPressed: (){
            alertDialoge(context);

          },
        ),
        body:CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,

              backgroundColor: Colors.amber,

              leading: Container(
                padding: EdgeInsets.all(13),

                  child: InkWell(child: Icon(Icons.arrow_back,color: Colors.white,),
                     onTap: (){
                    conformDialoge();
                     },
                  ),

              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Corona Tracker".toUpperCase(),style: TextStyle(letterSpacing:3,color: Colors.white,fontSize:15,),textAlign: TextAlign.center,),
             //   background:
                /* Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child:Image.asset("assets/image1.jpg",
                        fit: BoxFit.cover,
                        ),
                    ),
                  ],
                ),*/
              ),
              actions: <Widget>[

              ],
            ),

           SliverList(
             delegate:SliverChildListDelegate(

              loading?loadIndicator():_getItems()),
           )


          ],
        )
      ),
    );
  }

 List<Widget> loadIndicator() {
    List<Container> list=[];
    var length=1;
    for(int i=0;i<length;i++){
      list.add(Container(
         padding: EdgeInsets.only(top: 200,left: 160,right: 160),
          child: CircularProgressIndicator()));
    }
    return list;
 }
}


