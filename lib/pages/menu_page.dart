import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturant/components/buttons.dart';
import 'package:resturant/components/food_tile.dart';
import 'package:resturant/models/shop.dart';
import 'package:resturant/pages/food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}
class _MenuPageState extends State<MenuPage> {
  
//navigating to the particular details page
void navigateToFoodDetails(int index){
  //get the shop and its menu
  final shop = context.read<Shop>();   //accessing the shop class from anywhere,we are accessing it in this page now
  final foodMenu = shop.foodMenu;
  Navigator.push(context,MaterialPageRoute(builder: (context)=> FoodDetailsPage(food: foodMenu[index],),),);
}
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
     final appBarHeight = AppBar().preferredSize.height;
     final padding = MediaQuery.of(context).viewPadding; 

    //get the shop and its menu
  final shop = context.read<Shop>();   //accessing the shop class from anywhere,we are accessing it in this build method
  final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor:  Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.grey[800],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          //cart button  to go to cart page
          IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/cartpage'); //named route
          }, 
          icon: Icon(Icons.shopping_cart)
          )
        ],
        title: Text(
          "Tokyo",
          style: TextStyle(
        //    color: Colors.grey,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight- appBarHeight-padding.top, 
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //promo banner
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 138, 60, 55),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.symmetric(vertical: screenHeight*0.024,horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            //promo message
                        Text(
                          "Get 32% Promo",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20,
                            color: Colors.white
                          ) ,
                        ),
                        SizedBox(height: screenHeight*0.03,), //spce between get 32 percent and redeem button in the contAINER
                        //redeem button
                        MyButton(
                          text: "Redeem", 
                          onTap: (){}
                        ), 
                          ],
                        ),
                        //image
                        Image.asset(
                          'lib/images/sushi.png',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
              
                 SizedBox(height: 20 /*screenHeight* 0.02*/,),
              
                  //search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                            color: Colors.white,        
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                            color: Colors.white,        
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        hintText: "Search here",
                      ),
                    ),
                  ),
              
                   SizedBox(
                    height:20/*screenHeight * 0.02*/,
                  ),
              
                  //menu list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  8.0),
                    child: Text(
                      "Food Menu",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 18
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20 /*screenHeight*0.01*/,),
              
                  //were displaying a list of food items
                  SizedBox(               
                  height: screenHeight* 0.35,        //consider using a percentage of the screen                 
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodMenu.length,   //recall foodmenu is the name of the list
                      itemBuilder: (context,index)=> FoodTile(
                        food: foodMenu[index],
                        onTap:()=> navigateToFoodDetails(index)   //index helps us know which item
                      ),
                    ),
                  ),
              
                   SizedBox(height: 20 /*screenHeight*0.015*/,),
                  
                  //popular food...
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(left: 25,right: 25, ),
                    padding:  EdgeInsets.symmetric(horizontal: 21, vertical: screenHeight* 0.025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            //image
                        Image.asset('lib/images/sushi (1).png',
                        height: screenHeight*0.075,
                        ),
              
                        const SizedBox(width: 20,),
              
                        //name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              "Salmon Eggs",
                              style: GoogleFonts.dmSerifDisplay(
                                fontSize: 18,
                              ),                     
                            ),
              
                   //          SizedBox(height: screenHeight*0.015,),
              
                            //price
                            Text( 
                              '\$21.00',
                              style: TextStyle(
                                color: Colors.grey[700]
                              ),
                            ),
              
                          ],
                        ),
                          ],
                        ),
                        
                        //heart
                        const Icon(
                          Icons.favorite_outline,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}