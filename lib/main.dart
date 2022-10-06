import 'package:data_print/MovieDetail.dart';
import 'package:flutter/material.dart';
import 'moviemodel.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Horizontal & Vertical ListView"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(
                height: 230,
                child: ListView.builder(
                  itemCount: movieList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,int index) =>
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieDetail(movier:movieList[index])));
                    },
                    child:Card(
                      margin: EdgeInsets.all(10),

                      child:Container(
                        padding: EdgeInsets.only(top: 25),
                      height: 200,
                      width: 100,

                      child:Column(
                        children:[
                          Center(
                            child:Image.network(movieList[index].imageUrl),

                          ),
                          Text(movieList[index].title)
                        ],
                      )


                  ),
                    )
                  ),
                  ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: topRatedMovieList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index) =>
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieDetail(movier: topRatedMovieList[index])));
                        },
                      child:Card(
    margin: EdgeInsets.only(top:20,right: 30,bottom: 20),
                      child: Row(

                          children: [

                            Image.network(topRatedMovieList[index].imageUrl,height: 150,width: 150,),
                            Expanded(

                                child:Column(

                                  children:[

                                    Text(topRatedMovieList[index].description,textAlign:TextAlign.justify),

                                  ],

                                )

                            ),
                          ]

                      )

                  ),
      ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }
}
