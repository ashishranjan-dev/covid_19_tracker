import 'package:get/get.dart';

import '../models/world_data_model.dart';
import '../utilities/api/api.dart';

class GetworldInfoController extends GetxController {
  NetworkServices apis = NetworkServices();

  Rx<WorldDataModel> worldData = WorldDataModel().obs;

  var dataloading = false.obs;

  var date = 0.obs;
  var population = 0.obs;
  var cases = 0.obs;
  var todaycases = 0.obs;
  var deaths = 0.obs;
  var todaydeaths = 0.obs;
  var recovered = 0.obs;

  var todayrecovered = 0.obs;

  var active = 0.obs;

  var crtical = 0.obs;

  @override
  void onInit() {
    getworldData();
    super.onInit();
  }

  getworldData() async {
    try {
      dataloading.value = true;
      var result = await apis.getWorlddata();

      print('result');

      if (result != null) {
        worldData.value = result;

        date.value = worldData.value.updated!;
        cases.value = worldData.value.cases!;
        todaycases.value = worldData.value.todayCases!;
        deaths.value = worldData.value.deaths!;
        todaydeaths.value = worldData.value.todayDeaths!;
        recovered.value = worldData.value.recovered!;
        todayrecovered.value = worldData.value.todayRecovered!;
        active.value = worldData.value.active!;
        crtical.value = worldData.value.critical!;
        population.value = worldData.value.population!;

        dataloading.value = false;
      } else {
        print('null');
      }
    } finally {
      dataloading.value = false;
    }
    update();
  }
}
