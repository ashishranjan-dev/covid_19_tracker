// To parse this JSON data, do
//
//     final accountInformation = accountInformationFromJson(jsonString);

import 'dart:convert';

List<CountryDataModel> accountInformationFromJson(String str) => List<CountryDataModel>.from(json.decode(str).map((x) => CountryDataModel.fromJson(x)));

String accountInformationToJson(List<CountryDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryDataModel {

  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;

  CountryDataModel({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });



  factory CountryDataModel.fromJson(Map<String, dynamic> json) => CountryDataModel(
    updated: json["updated"],
    country: json["country"],
    countryInfo: CountryInfo.fromJson(json["countryInfo"]),
    cases: json["cases"],
    todayCases: json["todayCases"],
    deaths: json["deaths"],
    todayDeaths: json["todayDeaths"],
    recovered: json["recovered"],
    todayRecovered: json["todayRecovered"],
    active: json["active"],
    critical: json["critical"],
    casesPerOneMillion: json["casesPerOneMillion"],
    deathsPerOneMillion: json["deathsPerOneMillion"],
    tests: json["tests"],
    testsPerOneMillion: json["testsPerOneMillion"],
    population: json["population"],
    continent: json["continent"],
    oneCasePerPeople: json["oneCasePerPeople"],
    oneDeathPerPeople: json["oneDeathPerPeople"],
    oneTestPerPeople: json["oneTestPerPeople"],
    activePerOneMillion: json["activePerOneMillion"].toDouble(),
    recoveredPerOneMillion: json["recoveredPerOneMillion"].toDouble(),
    criticalPerOneMillion: json["criticalPerOneMillion"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "updated": updated,
    "country": country,
    "countryInfo": countryInfo!.toJson(),
    "cases": cases,
    "todayCases": todayCases,
    "deaths": deaths,
    "todayDeaths": todayDeaths,
    "recovered": recovered,
    "todayRecovered": todayRecovered,
    "active": active,
    "critical": critical,
    "casesPerOneMillion": casesPerOneMillion,
    "deathsPerOneMillion": deathsPerOneMillion,
    "tests": tests,
    "testsPerOneMillion": testsPerOneMillion,
    "population": population,
    "continent": continent,
    "oneCasePerPeople": oneCasePerPeople,
    "oneDeathPerPeople": oneDeathPerPeople,
    "oneTestPerPeople": oneTestPerPeople,
    "activePerOneMillion": activePerOneMillion,
    "recoveredPerOneMillion": recoveredPerOneMillion,
    "criticalPerOneMillion": criticalPerOneMillion,
  };
}

class CountryInfo {
  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  int? id;
  String? iso2;
  String? iso3;
  double? lat;
  double? long;
  String? flag;

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
    id: json["_id"] == null ? null : json["_id"],
    iso2: json["iso2"] == null ? null : json["iso2"],
    iso3: json["iso3"] == null ? null : json["iso3"],
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "iso2": iso2 == null ? null : iso2,
    "iso3": iso3 == null ? null : iso3,
    "lat": lat,
    "long": long,
    "flag": flag,
  };
}
