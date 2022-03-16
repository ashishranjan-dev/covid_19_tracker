

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class loader{

 static  Widget laoder({required context}){

    return Container(
      color: Color.fromARGB(255, 20, 20, 20),
      height: MediaQuery.of(context).size.height,
      child: Column
      
      
      (

        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [



        CircularProgressIndicator(color: Color.fromARGB(255, 217, 10, 253),),

        

SizedBox(
  height: 15,
),


        Image.asset('lib/assets/myimages/con3.gif')
      ],)
    );
  }

 
                                 
                                   
}