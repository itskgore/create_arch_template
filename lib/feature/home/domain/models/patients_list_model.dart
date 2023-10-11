class PatientInfoModel {
  String? id;
  String? name;
  String? dateTime;
  String? location;

  PatientInfoModel({this.id, this.name, this.dateTime, this.location});

  PatientInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateTime = json['dateTime'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dateTime'] = this.dateTime;
    data['location'] = this.location;
    return data;
  }
}
