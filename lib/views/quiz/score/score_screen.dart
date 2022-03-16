import 'package:covid_19_tracker/views/homepage_screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
         
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: GoogleFonts.manrope(
                  fontSize: size.width*0.06,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(197, 149, 5, 1)
                
                )
              ),
          
              Text(
                "${_qnController.numOfCorrectAns.toString()}/${_qnController.questions.length.toString()}",
                style:GoogleFonts.manrope(
                  fontSize: size.width*0.08,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 8, 5, 197)
                
                )
              ),

              SizedBox(height: 5,),

              ElevatedButton(onPressed: (){

                Get.offAll(()=>HomePageScreen());

            


              }, child: Text('Homepage'),
              style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(horizontal: size.width*0.15,vertical: 8),
            primary: Color.fromARGB(255, 66, 238, 71).withOpacity(0.6),
            textStyle: GoogleFonts.manrope(

            fontSize: size.width*0.04,
            color: Color.fromARGB(255, 44, 43, 44),
            fontWeight: FontWeight.w700

          
          
          
          
            
          
          ),
          shape: 
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide.none
          )
              )
              
              
              ),

              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}

