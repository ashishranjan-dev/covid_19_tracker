

import 'dart:async';

import 'package:covid_19_tracker/views/authscreens/screens/login.dart';
import 'package:covid_19_tracker/views/homepage_screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/constants/const_color.dart';

class CheckVaccinated extends StatefulWidget {
  const CheckVaccinated({Key? key}) : super(key: key);

  @override
  State<CheckVaccinated> createState() => _CheckVaccinatedState();
}

class _CheckVaccinatedState extends State<CheckVaccinated> {

  bool _isUserEmailVerified=false;
   Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState

     Future(() async {
        _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
            await FirebaseAuth.instance.currentUser!.reload();
            var user = FirebaseAuth.instance.currentUser;
            if (user!.emailVerified) {

            Get.offAll(HomePageScreen());
               
                timer.cancel();
            }
        });
    });

                 




    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(


      body:Container(
        height: size.height,
        width: size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [

            SizedBox(height: size.height*0.085,),
          
          Container(
            color: Colors.white,
            height: size.height*0.5,


            width: size.width*0.7,

            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset('lib/assets/myimages/con1.gif',),
            
            ),

          ),
          SizedBox(height: size.height*  0.04,),

          Text('Your email is not',style: GoogleFonts.manrope(

            fontSize: size.width*0.1,
            color: Color.fromARGB(255, 175, 142, 43),
            fontWeight: FontWeight.w400

          
          
          
          
          
          
          ), ),
            Text('Vaccinated',style: GoogleFonts.manrope(

            fontSize: size.width*0.09,
            color: Color.fromARGB(255, 201, 6, 240),
            fontWeight: FontWeight.w700

          
          
          
          
          
          
          ), ),

           SizedBox(height: size.height*  0.04,),


          ElevatedButton(onPressed: ()async{

            await FirebaseAuth.instance.currentUser!.sendEmailVerification();



            Get.snackbar('Vaccination email sended','',duration: Duration(seconds: 4),colorText: Colors.purpleAccent,
        messageText: Text('Please verify it to get Vaccinated',style: GoogleFonts.manrope(fontSize: size.width*0.04,fontWeight: FontWeight.w700,color:Colors.purpleAccent, ),),
         backgroundGradient: gradcolor,
     
            
        
        
        );






          }, child: Text('Get Vaccinated'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.15,vertical: 8),
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

            


          ),
          
          ),

          InkWell(
            onTap: (){
              Get.offAll(LoginScreen());
            },
            child: Text('Log in with diffrent id',style: GoogleFonts.manrope(
          
              fontSize: size.width*0.04,
              color: Color.fromARGB(255, 240, 146, 38),
              fontWeight: FontWeight.w700
          
            
            
            
            
            
            
            ), ),
          ),






        ]),
      
      
      
      )




      );

    
  }
}