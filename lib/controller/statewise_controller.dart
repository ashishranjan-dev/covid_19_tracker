

import 'package:get/get.dart';

import '../models/state_data_model.dart';
import '../utilities/api/api.dart';


class StateCoronaDataController extends GetxController{

  var datalist=<Statewise>[].obs;

var dataloading=true.obs;


  @override
  void onInit() {
    getdata();
    super.onInit();
  }



  void getdata()async{

      dataloading.value=true;


  List<Statewise> get=await NetworkServices.statesdata();

  if(get != null){

  


     datalist.assignAll(get);

       dataloading.value=false;


    //  print(datalist.toString());


  }


    dataloading.value=false;


   



  }

  


















}