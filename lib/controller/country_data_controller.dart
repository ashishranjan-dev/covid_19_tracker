import 'package:get/get.dart';

import '../models/country_data_model.dart';
import '../models/world_data_model.dart';
import '../utilities/api/api.dart';


class GetStatesInfoController extends GetxController {

  NetworkServices apis = NetworkServices();

  var datalist =<CountryDataModel>[].obs;

  var userloading = true.obs;

  @override
  void onInit() {
    getworldData();
    super.onInit();
  }

  getworldData() async {
    try {
      userloading.value = true;

      var result = await apis.fetchCountryRecords();



      if (result != null) {

        datalist.assignAll(result);

        print('data recieved');



      } else {

        print('null vlaues');

      }
    } finally {
      userloading.value = false;
    }
    update();
  }
}
