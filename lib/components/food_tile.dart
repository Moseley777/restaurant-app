import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturant/models/food.dart';

//food tile widget to return the list of Food tiles 
class FoodTile extends StatelessWidget { 
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key,required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:   BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5 ),   //INNER CHILDREN PADDING IN THE FOOD TILE
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image
            Image.asset(
              food.imagePath,
              height: screenHeight* 0.12,
            ),
            //text
             Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20
              ),                                   
            ),
            
      
             //price + rating
             SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
      
                  //price
                  Text(
                    '\$${food.price}',
                    style: TextStyle(
                      fontWeight:  FontWeight.bold,
                      color: Colors.grey[700]
                    ),
                  ),
      
                  //rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                  ),
                  Text(
                    food.rating,
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                    ],
                  )
                ],
              ),
             )
          ],
        ),
      ),
    );
  }
}