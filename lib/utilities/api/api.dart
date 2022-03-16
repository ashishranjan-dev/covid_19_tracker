import 'dart:async';
import 'dart:convert';


import 'package:covid_19_tracker/models/country_data_model.dart';
import 'package:covid_19_tracker/models/world_data_model.dart';
import 'package:covid_19_tracker/utilities/api/api_constants.dart';
import 'package:http/http.dart' as http;

import '../../models/state_data_model.dart';

class NetworkServices {
  Future<WorldDataModel?> getWorlddata() async {
    var response;
    try {
      print('sending');

      response = await http.get(Uri.parse(ApiUrl.worlddata));
      if (response.statusCode == 200) {
        print(response.body);
        return WorldDataModel.fromJson(jsonDecode(response.body));
      } else {
        print('ashish');
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<CountryDataModel>?> fetchCountryRecords() async {
   
    var response;

    try {
    response = await http.get(Uri.parse(ApiUrl.countriesdata));

      if (response.statusCode == 200) {
        print(response.body);

    // ignore: unused_local_variable
    var res=response.body;

    return accountInformationFromJson(res);

    







    
        

      } else {

        return [];
        
      }

    } catch (E) {
      print(E.toString());
    }
  }

  static Future<List<Statewise>> statesdata()async{

var url = Uri.parse('https://data.covid19india.org/data.json');
var response = await http.get(url, );
print('Response status: ${response.statusCode}');

var data=jsonDecode(response.body);
var statewise=data['statewise'];

print(statewise);

if(response.statusCode==200){


  List<Statewise> statewisedata=List.from(statewise).map((e) => Statewise.fromJson(e)).toList();

  return statewisedata;


 
}


return [];












  
}






}
