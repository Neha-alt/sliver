import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stretchy_header/stretchy_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
List _buildList (int count){
  List<Widget> listItems =List();
  for(int i=0;i<count;i++){
    listItems.add(
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Card(
            color: Colors.grey.shade800,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Card ${i.toString()}',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue.shade200,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  return listItems;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/bg1.jpg',fit: BoxFit.cover,),
              stretchModes: [
                StretchMode.zoomBackground,
                
              ],
            ),
            leading: IconButton(
              icon: Icon(Icons.menu,color: Colors.black,size:30),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(_buildList(10)),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
             maxCrossAxisExtent: 200.0,
              childAspectRatio: 0.5,
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context,int index){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    ),
                  );
            },
              childCount: 10,

            ),
          ),
        ],
      ),
    );
  }
}