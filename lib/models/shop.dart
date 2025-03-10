//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:resturant/models/food.dart';

class Shop extends ChangeNotifier{
   //food menu list FROM FOOD CLASS
 final List<Food> _foodMenu =[
    Food(  //SALMON SUSHI
      name: "SALMON SUSHI", 
      price: "21.00", 
      imagePath: "lib/images/sushi (2).png", 
      rating: "4.9"
      ),
      Food(  //MAKI
      name: "MAKI", 
      price: "25.00", 
      imagePath: "lib/images/maki.png", 
      rating: "4.9",
      ),
      Food(  //MAKI
      name: "SUSHI", 
      price: "23.00", 
      imagePath: "lib/images/sushi.png", 
      rating: "5.0",
      ),
       Food(  //MAKI
      name: "SALMON EGGS", 
      price: "20.00", 
      imagePath: "lib/images/sushi (1).png", 
      rating: "4.7",
      ),
  ];

  //customers cart
  final List<Food> _cart = [];
  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

 

  //add to cart
  void addToCart(Food foodItem, int quantity){
    for(int i = 0;i< quantity; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
  
  
 /* Food? _selectedFood; // Property to hold the selected food item

  Food? get selectedFood => _selectedFood; // Getter for the selected food

  // Method to set the selected food...INSTEAD OF PASSING THE OBJECT THROUGH NAVIGATION
  void setSelectedFood(Food food) {
    _selectedFood = food;
    notifyListeners(); // Notify listeners when the selected food changes
  }*/

  
  
}