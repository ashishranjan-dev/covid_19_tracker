
// ignore_for_file: invalid_use_of_protected_member

import 'package:covid_19_tracker/utilities/widgets/formated_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/country_data_controller.dart';
import 'country_detail_screen.dart';


class CountriesDataList extends StatefulWidget {
  const CountriesDataList({Key? key}) : super(key: key);

  @override
  State<CountriesDataList> createState() => _CountriesDataListState();
}

class _CountriesDataListState extends State<CountriesDataList> {

    TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size height=MediaQuery.of(context).size;

    var countrylist=Get.put<GetStatesInfoController>(GetStatesInfoController());
    return  Scaffold(
      body: Container(
        color: Color.fromARGB(255, 232, 240, 212).withOpacity(0.6),
        child: Column(
          children: [

                 Padding(
                  padding:  EdgeInsets.only(right:8.0,top: height.height*0.08),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Search with country name',
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
              return countrylist.userloading.value
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
                          itemCount: countrylist.datalist.length,
                          itemBuilder: (context, index){
                            String name = countrylist.datalist.value[index].country.toString();
                            if(searchController.text.isEmpty){
                              return Column(
                                children: [

                                  InkWell(
                                    onTap: (){

                                      Get.to(()=> CountryDetailScreen(
                                        image:countrylist.datalist.value[index].countryInfo!.flag.toString(),
                                        name: countrylist.datalist.value[index].country.toString(),
                                        totalCases:  countrylist.datalist.value[index].cases!.toInt(),
                                        totalRecovered: countrylist.datalist.value[index].recovered!.toInt(),
                                        totalDeaths: countrylist.datalist.value[index].deaths!.toInt(),
                                        active: countrylist.datalist.value[index].active!.toInt(),
                                        test: countrylist.datalist.value[index].tests!.toInt(),
                                        todayRecovered: countrylist.datalist.value[index].todayRecovered!.toInt(),
                                        critical: countrylist.datalist.value[index].critical!.toInt(), 
                                        population: countrylist.datalist.value[index].population!.toInt(), 
                                        todaycases: countrylist.datalist.value[index].todayCases!.toInt(), 
                                        todaydeaths: countrylist.datalist.value[index].todayDeaths!.toInt(),
                                      ));
                                     
                                    },
                                    child: Card(
                                      color: Color.fromARGB(255, 235, 239, 241),
                                                        semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 75,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                                  child: ListTile(

                      
                                          leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(countrylist.datalist.value[index].countryInfo!.flag.toString()),),
                                          title: Text(countrylist.datalist.value[index].country.toString()) ,
                                          subtitle:    Text("Population: "+ formattedNumber(number: countrylist.datalist.value[index].population!.toInt())) ,
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
                            
                                            Get.to(()=> CountryDetailScreen(
                                        image:countrylist.datalist.value[index].countryInfo!.flag.toString(),
                                        name: countrylist.datalist.value[index].country.toString(),
                                        totalCases:  countrylist.datalist.value[index].cases!.toInt(),
                                        totalRecovered: countrylist.datalist.value[index].recovered!.toInt(),
                                        totalDeaths: countrylist.datalist.value[index].deaths!.toInt(),
                                        active: countrylist.datalist.value[index].active!.toInt(),
                                        test: countrylist.datalist.value[index].tests!.toInt(),
                                        todayRecovered: countrylist.datalist.value[index].todayRecovered!.toInt(),
                                        critical: countrylist.datalist.value[index].critical!.toInt(), 
                                        population: countrylist.datalist.value[index].population!.toInt(), 
                                        todaycases: countrylist.datalist.value[index].todayCases!.toInt(), 
                                        todaydeaths: countrylist.datalist.value[index].todayDeaths!.toInt(),
                                      ));
                                      }
                                                          
                                      ),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(countrylist.datalist.value[index].countryInfo!.flag.toString()),),
                                      title: Text(countrylist.datalist.value[index].country.toString()) ,
                                      subtitle:  Text("Population: "+ formattedNumber(number: countrylist.datalist.value[index].population!.toInt())) ,
                                    ),
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
