// To parse this JSON data, do
//
//     final accountInformation = accountInformationFromJson(jsonString);

import 'dart:convert';


class WorldDataModel {
    WorldDataModel({
        this.updated,
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
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion,
        this.affectedCountries,
    });

    int? updated;
    int? cases;
    int? todayCases;
    int? deaths;
    int? todayDeaths;
    int? recovered;
    int? todayRecovered;
    int? active;
    int? critical;
    int? casesPerOneMillion;
    double? deathsPerOneMillion;
    int? tests;
    double? testsPerOneMillion;
    int? population;
    int? oneCasePerPeople;
    int? oneDeathPerPeople;
    int? oneTestPerPeople;
    double? activePerOneMillion;
    double? recoveredPerOneMillion;
    double? criticalPerOneMillion;
    int? affectedCountries;

    factory WorldDataModel.fromJson(Map<String, dynamic> json) => WorldDataModel(
        updated: json["updated"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        todayRecovered: json["todayRecovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"].toDouble(),
        tests: json["tests"],
        testsPerOneMillion: json["testsPerOneMillion"].toDouble(),
        population: json["population"],
        oneCasePerPeople: json["oneCasePerPeople"],
        oneDeathPerPeople: json["oneDeathPerPeople"],
        oneTestPerPeople: json["oneTestPerPeople"],
        activePerOneMillion: json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"].toDouble(),
        affectedCountries: json["affectedCountries"],
    );

    Map<String, dynamic> toJson() => {
        "updated": updated,
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
        "oneCasePerPeople": oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople,
        "activePerOneMillion": activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion,
        "affectedCountries": affectedCountries,
    };
}
