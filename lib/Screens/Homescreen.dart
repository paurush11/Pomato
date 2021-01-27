import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: (){

          },
        ),
        title: Text("Pomato",style: TextStyle(
            fontSize: 25,
            fontFamily: "GloriaHallelujah",

            color: Colors.white
        )),
        centerTitle: true,
        actions: [
          FlatButton(onPressed: (){}, child: Text("Cart(${currentUser.cart.length})",style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),))
        ],

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8,color: Theme.of(context).primaryColor),
                ),
                hintText: "Search Food or Restaurant",
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){

                  },
                )

              ),

            ),
          )
        ],
      ),
    );
  }
}
