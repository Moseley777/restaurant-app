import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturant/components/buttons.dart';
//import 'package:resturant/main.dart';
import 'package:resturant/models/food.dart';
import 'package:resturant/themes/colors.dart';
import 'package:resturant/models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key,required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;
  //method to decrement AND increment
  void decrementQuantity(){
    setState(() {
      if(quantityCount > 0){
       quantityCount--;
      }
    });
  }

  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }
// add to cart method
void addToCart(){   //WE COULD PUT THIS IN THE ONPRESSED BELOW BUT WE USED A METHOD JUST TO AVOID MUCH CODE..SEPARATING CONCERNS
   //only add to the cart if there is something in the cart i.e the quantity >0
   if (quantityCount > 0){
    //get access to the shop cart
    final shop = context.read<Shop>();
    //add to cart
    shop.addToCart(widget.food,quantityCount);
    //let the user know it was successful
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context)=> AlertDialog(
        backgroundColor: primaryColor,
         content: Text(
          "Successfully added to cart",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
         ),
         actions: [
          //okay button
          IconButton(
            onPressed: (){
              //pop once to remove dialog box
              Navigator.pop(context);
              //pop again to go to previous screen
              Navigator.pop(context);
            }, 
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            )
           )
         ],
      ),
     );
   }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.grey[900],
          ),
          body: Column(
            children: [
              //listview of food details
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListView(
                      children: [
                        //IMAGE
                        Image.asset(
                          widget.food.imagePath,
                          height: 200,
                        ),
                    
                    
                        //RATING
                        Row(
                          children: [
                            //star icon
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                            ),
                    
                            SizedBox(width: 10,),
                    
                            //rating number
                            Text(
                              widget.food.rating,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 10,),
                        //FOOD NAME
                        Text(
                          widget.food.name,
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 28
                          ),
                        ),

                        SizedBox(height: 25,),

                       // DESCRIPTION
                       Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                       ),

                        SizedBox(height: 10,),

                        Text(
                          "Delicate sliced,fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ),

              //price + quantity + add to cart
              Container(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      //price+quantity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //price
                          Text(
                            "\$${widget.food.price}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),

                          //quantity
                          Row(
                            children: [
                              //minus button
                              Container(
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  onPressed: decrementQuantity, 
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              //quantity count
                              SizedBox(
                                width: 40,  //wrap text in sized box because longer quantitCount text was increasing the distance between buttons
                                child: Center(
                                  child: Text(
                                    quantityCount.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              //plus button
                               Container(
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  onPressed: incrementQuantity, 
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      
                      const SizedBox(height: 15,),
                      //add to cart button
                      MyButton(
                        text: "Add to Cart", 
                        onTap: addToCart
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
    );
  }
}