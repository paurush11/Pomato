
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class RecentOrders extends StatelessWidget {

  _buildrecentorder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width-40,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1,color: Colors.grey[200])
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Row(
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(15),
               child: Image(
                 height: MediaQuery.of(context).size.height/8,
                 width: MediaQuery.of(context).size.width/3,
                 image: AssetImage(order.food.imageUrl),),
             ),
             Container(
               margin: EdgeInsets.all(12),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(order.food.name, style: KText, overflow: TextOverflow.ellipsis,),
                   SizedBox(height: 4,),
                   Text(order.restaurant.name, style: KText, overflow: TextOverflow.ellipsis),
                   SizedBox(height: 4,),
                   Text(order.date, style: KText, overflow: TextOverflow.ellipsis),

                 ],
               ),

             ),
           ],
         ),

          Container(
            margin: EdgeInsets.only(right: 20),
            width: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.add), onPressed: (){

            },),

          )
        ],
      ),
    );
  }
   @override
   Widget build(BuildContext context) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Padding(
           padding: const EdgeInsets.symmetric(horizontal : 20.0),
           child: Text("Recent Orders", style: TextStyle(
             fontSize: 24,
             fontWeight: FontWeight.w600,
             letterSpacing: 1.2
           ),),
         ),
         Container(
           height: MediaQuery.of(context).size.height/6,

           child: ListView.builder(
             itemBuilder: (BuildContext context,int index){
               Order order = currentUser.orders[index];
               return _buildrecentorder(context, order);
             },
             itemCount: currentUser.orders.length,
             scrollDirection: Axis.horizontal,
           ),
         )
       ],
     );
   }
 }
