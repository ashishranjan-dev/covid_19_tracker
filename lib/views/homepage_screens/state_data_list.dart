
// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/statewise_controller.dart';
import 'stae_data_details_screen.dart';

class StatesDataList extends StatefulWidget {
  const StatesDataList({Key? key}) : super(key: key);

  @override
  State<StatesDataList> createState() => _StatesDataListState();
}

class _StatesDataListState extends State<StatesDataList> {

    TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    var statelist=Get.put(StateCoronaDataController());
    return  Scaffold(
      body: Container(
        color: Color.fromARGB(255, 232, 240, 212).withOpacity(0.4),
        child: Column(
          children: [

                 Padding(
                  padding:  EdgeInsets.only(right:8.0,top: size.height*0.08),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Search with state name',
                      suffixIcon: searchController.text.isEmpty ? const Icon(Icons.search) :
                      GestureDetector(
                          onTap: (){
                            searchController.text = "" ;
                            setState(() {
                            });
                            },
                          child: Icon(Icons.clear)),
          
                    ),
                    onChanged: (value){
                      setState(() {

                      

                        
          
                      });
                    },
                  ),
          
                ),
            Expanded(
              child: Obx(() {
              return statelist.dataloading.value
                  ?  ListView.builder(
                       itemCount: 4,
                       itemBuilder: (context, index){
                         return Shimmer.fromColors(
                           baseColor: Colors.grey.shade700,
                           highlightColor: Colors.grey.shade100,
                           enabled: true,
                           child: Column(
                             children: [
                               ListTile(
                                 leading:  Container(height: 50 , width: 50, color: Colors.white,),
                                 title:  Container(
                                   width: 100,
                                   height: 8.0,
                                   color: Colors.white,
                                 ),
                                 subtitle:  Container(
                                   width: double.infinity,
                                   height: 8.0,
                                   color: Colors.white,
                                 ),
                               ),
          
                             ],
                           ),
                         );
                     
                       }
                     )
                  : 
ListView.builder(
                          itemCount: statelist.datalist.length,
                          itemBuilder: (context, index){
                            String name = statelist.datalist.value[index].state.toString();
                            if(searchController.text.isEmpty){
                              return Column(
                                children: [

                                  InkWell(
                                    onTap: (){

                                      Get.to(()=>StatedetailScreen(
                                        
                                        active: statelist.datalist.value[index].active.toString(),
                                       confirmed: statelist.datalist.value[index].confirmed.toString(),
                                       dealtadeaths:statelist.datalist.value[index].deltadeaths.toString(),
                                       deaths: statelist.datalist.value[index].deaths.toString(), 
                                       deltaconfirmed: statelist.datalist.value[index].deltaconfirmed.toString(),
                                        deltarecovered: statelist.datalist.value[index].deltarecovered.toString(),
                                         recovered: statelist.datalist.value[index].recovered.toString(),
                                          state: statelist.datalist.value[index].state.toString(),
                                          
                                          ));



                                     
                                     
                                    },
                                    child: Card(
                                      color: Colors.white.withOpacity(0.8),
                                                        semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 75,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                                  child: ListTile(
                                          title: Text(statelist.datalist.value[index].state.toString(),style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.width*0.045


                                          ),) ,
                                          subtitle:    Text("Active: "+ statelist.datalist.value[index].active!,style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w300,
                                            fontSize: size.width*0.038


                                          ))
                                        ),
                                ),
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
          
                            }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                              return Column(
                                children: [
                                  Card(

                                       semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 35,

                                    child: ListTile(
                                      onTap: (() {

                                    Get.to(()=>StatedetailScreen(
                                        
                                        active: statelist.datalist.value[index].active.toString(),
                                       confirmed: statelist.datalist.value[index].confirmed.toString(),
                                       dealtadeaths:statelist.datalist.value[index].deltadeaths.toString(),
                                       deaths: statelist.datalist.value[index].deaths.toString(), 
                                       deltaconfirmed: statelist.datalist.value[index].deltaconfirmed.toString(),
                                        deltarecovered: statelist.datalist.value[index].deltarecovered.toString(),
                                         recovered: statelist.datalist.value[index].recovered.toString(),
                                          state: statelist.datalist.value[index].state.toString(),
                                          
                                          ));


                                      


                                      }
                                                          
                                      ),
                                      
                                      title: Text(statelist.datalist.value[index].state.toString()) ,
                                      subtitle:  Text("Population: "+  statelist.datalist.value[index].active!)) ,
                                    ),
 
                                  Divider()
                                ],
                              );
                            }else {
                              return Container();
                            }
                          }
                      );
            }))
          ],
        ),
      ),
    );
  }
}
