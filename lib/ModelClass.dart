class ModelClass{

  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  ModelClass({this.country, this.cases, this.todayCases, this.deaths,
      this.todayDeaths, this.recovered});
  factory ModelClass.fromJson(Map<String,dynamic> json){
    return ModelClass(
      country: json["country"],
      cases: json["cases"],
      todayCases:json["todayCases"],
      deaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      recovered: json["recovered"]
    );
  }



}