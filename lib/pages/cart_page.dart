import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant/components/buttons.dart';
import 'package:resturant/models/food.dart';
import 'package:resturant/models/shop.dart';
import 'package:resturant/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart   ///NOTE WE CULD PUT THE METHOD INSIDE ONPRESSED
  void removeFromCart(Food food, BuildContext context){
   //get access to the shop
   final shop = context.read<Shop>();
                     
   shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) { //consumer watches only its child widgets
    return Consumer<Shop>(    //to be able to access all the values in the class
      builder: (context,value,child)=> Scaffold(
        backgroundColor: primaryColor,
       appBar: AppBar(
        elevation: 0,
        title: Text(
          "My Cart"
        ),
        backgroundColor: primaryColor,
       ),
       body: Column(
         children: [
           Expanded(
             child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context,index){
                //get food from cart
                final Food food = value.cart[index];               
                //get food name
                final String foodName = food.name;             
                //get food price
                final String foodPrice = food.price;
             
                //returN list tile
                return Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  margin: EdgeInsets.only(left: 20,top: 20,right:20),
                  child: ListTile(
                     title: Text(
                      foodName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                     ),
                     subtitle: Text(
                      foodPrice,
                      style: TextStyle(
                        color: Colors.grey[200] , 
                      ),
                      ),
                     trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey[300],
                        ),
                        onPressed: ()=> removeFromCart(food,context), 
                    ),
                  ),
                );
              }
             ),
           ),

           //PAY BUTTON
           Padding(
             padding: const EdgeInsets.all(25.0),
             child: MyButton(
              text: "Pay Now", 
             onTap: (){}
             ),
           )
         ],
       ),
    ),
   );
  }
}