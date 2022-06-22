class HomeModel {
  bool? success;
  String? city;
  List<HomeResult>? result;

  HomeModel({this.success, this.city, this.result});

  HomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    city = json['city'];
    if (json['result'] != null) {
      result = <HomeResult>[];
      json['result'].forEach((v) {
        result!.add(HomeResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['city'] = this.city;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeResult {
  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  HomeResult(
      {this.date,
      this.day,
      this.icon,
      this.description,
      this.status,
      this.degree,
      this.min,
      this.max,
      this.night,
      this.humidity});

  HomeResult.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    icon = json['icon'];
    description = json['description'];
    status = json['status'];
    degree = json['degree'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = this.date;
    data['day'] = this.day;
    data['icon'] = this.icon;
    data['description'] = this.description;
    data['status'] = this.status;
    data['degree'] = this.degree;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['humidity'] = this.humidity;
    return data;
  }
}
