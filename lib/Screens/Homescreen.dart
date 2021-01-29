import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/location.dart';
import 'package:food_delivery/Widgets/locationfetch.dart';
import 'package:food_delivery/Widgets/paytm.dart';
import 'package:food_delivery/Widgets/rating_stars.dart';
import 'package:food_delivery/Widgets/recent_orders.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/restaurant.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants(){
    List<Widget> restaurantlist = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantlist.add(Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width-40,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1,color: Colors.grey[200])
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                height: MediaQuery.of(context).size.height/8,
                width: MediaQuery.of(context).size.width/3,
                image: AssetImage(restaurant.imageUrl),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant.name, style: KText, overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 4,),
                    RatingStars(restaurant.rating),
                    SizedBox(height: 4,),
                    Text(restaurant.address, style: KText, overflow: TextOverflow.ellipsis),

                  ],
                ),

              ),
            ),
          ],
        ),
      ));
    });
    return Column(children: restaurantlist,);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 30.0,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Locationfetch()));
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

            ),
            RecentOrders(),
            //Paytm(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Nearby Restaurants", style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2
                  ),),
                ),
                _buildRestaurants()
              ],
            )
          ],
        ),
      ),
    );
  }
}
