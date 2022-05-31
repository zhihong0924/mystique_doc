// ignore_for_file: deprecated_member_use

class MenuModel {
  List<Data> data;

  MenuModel({this.data});

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String topic;
  List<String> subTopic;

  Data({this.topic, this.subTopic});

  Data.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    if (json['subTopic'] != null) {
      subTopic = json['subTopic'].cast<String>();
    } else {
      subTopic = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    data['subTopic'] = this.subTopic;
    return data;
  }
}
