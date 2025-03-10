import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturant/components/buttons.dart';
import 'package:resturant/themes/colors.dart';
//import 'dart:ui';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final heightOfScreen = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child:  ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                //shop name
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                  'SUSHIMAN',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                ],
               ),
               const SizedBox(height: 25,),
          
              //icon
              SizedBox(
                height: heightOfScreen*0.4,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset('lib/images/sushi (1).png',),
                ),
              ),
              //title
              Text(
                 'Taste of Japanese Food.'.toUpperCase(),
                 style: GoogleFonts.dmSerifDisplay(
                    fontSize: 44,
                    color: Colors.white,
                  ),
              ),
              const SizedBox(height: 10,),
          
              //subtitle
              Text(
                "Feel the taste of the most popular Japanese food from anywhere and anytime ",
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 2  //distance between texts on different lines
                ),
              ),
              const SizedBox(height: 25,),
              //get started button
              MyButton(
                text: 'Getstarted',
                onTap: (){
                  //GO TO MENU PAGE
                  Navigator.pushNamed(context, '/menupage');
                },
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}