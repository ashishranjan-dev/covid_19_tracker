import 'package:covid_19_tracker/services/authservices.dart';
import 'package:covid_19_tracker/views/homepage_screens/preventions.dart';
import 'package:covid_19_tracker/views/quiz/welcome/welcome_screen.dart';
import 'package:covid_19_tracker/views/homepage_screens/state_data_list.dart';
import 'package:covid_19_tracker/views/homepage_screens/symptoms.dart';
import 'package:covid_19_tracker/views/homepage_screens/world_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import '../../utilities/widgets/animated_text2.dart';
import 'FAQ.dart';
import 'country_list.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
   AnimationController? _controller2;

  
  Animation<double>? _animation;
  Animation<double>? _animation2;
   Animation<double>? _animation3;
   Animation<double>? _animation4;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

     _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds:10),
    );
    
    

    _animation = Tween<double>(begin: 1, end: 45)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -60, end: 0).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.decelerate));

        
    _animation3 = Tween<double>(begin: 5, end: 165).animate(
        CurvedAnimation(parent: _controller2!, curve: Curves.easeIn))
        ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller2!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller2!.forward();
        }
      });

         _animation4 = Tween<double>(begin: 125, end:-75).animate(
        CurvedAnimation(parent: _controller2!, curve: Curves.easeIn));

    _controller!.forward();
   
      _controller2!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();

     _controller2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;

    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243).withOpacity(0.9),
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 33, 42, 165).withOpacity(0.85),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                height: _h * 0.45,
                child: Stack(
              
                  children: [

                    Positioned(
                      top: _h*0.1,
                      left: _w*0.03,
                      child: Container(
                        height: _h*0.35,
                        width: _w*0.50,
                       
                    
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/assets/images/doctor.png'),),
                        
                        
                                      ),
                    ),
                    //corona1

                    
                    Positioned(
                      top: _h*0.10,
                      left: _w *0.50 + (_animation3!.value + .05),
                      child: Container(

                        height: _h*0.10,
                        width: _w*0.10,
                       
                    
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/assets/images/corona.png'),),
                        
                        
                                      ),
                    ),
                       //corona2

                    
                    Positioned(
                      top: _h*0.35,
                      left: _w *0.73 + (_animation4!.value + .05),
                      child: Container(

                        height: _h*0.10,
                        width: _w*0.10,
                       
                    
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/assets/images/corona.png'),),
                        
                        
                                      ),
                    ),

   //corona3

                    
                    Positioned(
                      top: _h*0.15,
                      left: _w *0.73 + (_animation4!.value + .05),
                      child: Container(

                        height: _h*0.10,
                        width: _w*0.10,
                       
                    
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/assets/images/corona.png'),),
                        
                        
                                      ),
                    ),

   //corona4

                    
                    Positioned(
                      top: _h*0.34,
                      left: _w *0.50 + (_animation3!.value + .05),
                      child: Container(

                        height: _h*0.10,
                        width: _w*0.10,
                       
                    
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/assets/images/corona.png'),),
                        
                        
                                      ),
                    ),

   //corona5

                    
                    Positioned(
                      top: _h*0.20,
                      left: _w *0.53 + (_animation3!.value + .05),
                      child: Container(

                        height: _h*0.15,
                        width: _w*0.20,
                       
                    
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/assets/images/corona.png'),),
                        
                        
                                      ),
                    ),







                    Positioned(
                      top: _h*0.02,
                      left: _w*0.5,
                      child: Container(
                        height: _h*0.44,
                        width: _w*0.53,
                  
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('lib/assets/images/virus2.png'),),
                        
                        
                                      ),
                    ),


                  
            
                    //texts

                    Positioned(
                    top: _h*0.025,
                      left: _w*0.1,
                      
                      
                      child: AnimatedText2(Size1: _w*0.075, Size2: _w*0.1, Text2:'Coronavirus', Text1: '  Covid-19',))
                 
                
                  ],
                ),
              ),
              SizedBox(
                height: _h * 0.020,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10
                  


                ),
                padding: const EdgeInsets.symmetric(vertical:20),
                decoration: const BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.only(

                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),

                  )
                 
                ),
                child: Column(
                  children: [

                    
                    homePageCardsGroup(
                          Color.fromARGB(255, 250, 248, 248),
                        Colors.white,
                       Image.asset('lib/assets/myimages/country.png'),
                        'country',
                        context,
                        CountriesDataList(),
                        Colors.white,
                        Image.asset('lib/assets/myimages/india.png'),
                      
                        'State Wise data',
                        StatesDataList()
                        ),

                        

                    homePageCardsGroup(
                         Color.fromARGB(255, 250, 248, 248),
                        Color.fromARGB(255, 247, 248, 245),
                        Image.asset('lib/assets/myimages/world.png'),
                       
                        'World',
                        context,
                                
                        WorldDataScreen(),

                        Color.fromARGB(255, 247, 248, 245),
                       Image.asset('lib/assets/myimages/ideas.png'),
                        'Quiz',
                        
                       
                          QuizwelcomeScreen(),
                        
                        ),


                    homePageCardsGroup(
                      Colors.white,
                      Color.fromARGB(255, 248, 245, 243),
                      Image.asset('lib/assets/images/breathing.png'),
                      'Symptoms',
                      context,
                      BoardingSymptoms(),
                      Color.fromARGB(255, 247, 244, 244),
                      Image.asset('lib/assets/images/wear_mask.png'),
                      'Preventions',
                      preventions(),
                    ),


                    homePageCardsGroup(
                          Color.fromARGB(255, 250, 248, 248),
                        Colors.white,
                         Image.asset('lib/assets/images/question.png'),
                                'Faq',
                         context,
                 
                        
                       
                          faqQue() ,
                        Colors.lightGreen,
                         Image.asset('lib/assets/images/breathing.png'),
                        'Example',
                        RouteWhereYouGo(),
                        
                        ),
                  
                  ],
                ),
              )
            ],
          ),

          /// SETTING ICON
          Padding(
            padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  highlightColor: Color.fromARGB(0, 211, 12, 12),
                  splashColor: Colors.transparent,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Auth.singout();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: _w / 8.5,
                        width: _w / 8.5,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 245, 153).withOpacity(.4),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.logout_outlined,
                            size: _w / 17,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget homePageCardsGroup(
       Color main,
      Color color,
      Image pic,
   
      String title,
      BuildContext context,
      Widget route,
      Color color2,
      Image pic2,
      String title2,
      Widget route2,
   
      
      ) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(main,color, pic, title, context, route),
          homePageCard(main,color2, pic2, title2, context, route2),
        ],
      ),
    );
  }

  Widget homePageCard(Color main,Color color, Image pic, String title,
      BuildContext context, Widget route) {
            double _h = MediaQuery.of(context).size.height;
                 double _w = MediaQuery.of(context).size.width;

    double w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: 0.9,
      child: Transform.translate(
        offset: Offset(0, _animation2!.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(5),
            height: _w / 1.65,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: main,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

          
              children: [
     
                Container(
                  height: _h / 4.5,
                  width: _w / 3.3,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.9),
                  
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: pic,
                  )
                ),

                SizedBox(height: 2,),

                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: _w*0.05,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: _w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 25,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}

                      