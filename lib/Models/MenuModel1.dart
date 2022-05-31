// ignore_for_file: deprecated_member_use

class MenuDataModel {
  List<HomeData> homeData;
  String docsTitle;
  String docsDesc;
  List<Data> data;

  MenuDataModel({this.homeData, this.docsTitle, this.docsDesc, this.data});

  MenuDataModel.fromJson(Map<String, dynamic> json) {
    if (json['HomeData'] != null) {
      homeData = new List<HomeData>();
      json['HomeData'].forEach((v) {
        homeData.add(new HomeData.fromJson(v));
      });
    } else {
      homeData = [];
    }

    docsTitle = json['docsTitle'];
    docsDesc = json['docsDesc'];

    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeData != null) {
      data['HomeData'] = this.homeData.map((v) => v.toJson()).toList();
    }
    data['docsTitle'] = this.docsTitle;
    data['docsDesc'] = this.docsDesc;

    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeData {
  String stepTitle;
  String stepDesc;

  HomeData({this.stepTitle, this.stepDesc});

  HomeData.fromJson(Map<String, dynamic> json) {
    stepTitle = json['step_title'];
    stepDesc = json['step_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_title'] = this.stepTitle;
    data['step_desc'] = this.stepDesc;
    return data;
  }
}

class SubDocs {
  String docsSubTopic;
  String docsDesc;

  SubDocs({this.docsSubTopic, this.docsDesc});

  SubDocs.fromJson(Map<String, dynamic> json) {
    docsSubTopic = json['docsSubTopic'];
    docsDesc = json['docsDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docsSubTopic'] = this.docsSubTopic;
    data['docsDesc'] = this.docsDesc;
    return data;
  }
}

class Data {
  String topic;
  List<SubTopic> subTopic;
  Content content;

  Data({this.topic, this.subTopic, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    if (json['subTopic'] != null) {
      subTopic = new List<SubTopic>();
      json['subTopic'].forEach((v) {
        subTopic.add(new SubTopic.fromJson(v));
      });
    } else {
      subTopic = [];
    }
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    if (this.subTopic != null) {
      data['subTopic'] = this.subTopic.map((v) => v.toJson()).toList();
    }
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    return data;
  }
}

class SubTopic {
  String topic;
  Content content;

  SubTopic({this.topic, this.content});

  SubTopic.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    return data;
  }
}

class Content {
  String title;
  String description;
  List<Steps> steps;
  var tableCompare;
  List<Tables> tables;

  Content({this.title, this.description, this.steps});

  Content.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];

    if (json['steps'] != null) {
      steps = new List<Steps>();
      json['steps'].forEach((v) {
        steps.add(new Steps.fromJson(v));
      });
    } else {
      steps = [];
    }

    if (json['tableCompare'] != null) {
      //set table data
      tableCompare = json['tableCompare'];
    } else {
      tableCompare = '';
    }

    if (json['tables'] != null) {
      tables = new List<Tables>();
      json['tables'].forEach((v) {
        tables.add(new Tables.fromJson(v));
      });
    } else {
      tables = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    if (this.tables != null) {
      data['tables'] = this.tables.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tables {
  String title;
  var data;

  Tables({this.title, this.data});

  Tables.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data'] != null) {
      data = json['data'];
    } else {
      data = '';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> datajson = new Map<String, dynamic>();
    datajson['title'] = this.title;
    datajson['data'] = this.data;

    return datajson;
  }
}

class Steps {
  String stepTitle;
  String stepDescription;
  String figure1;
  String stepDesc;

  Steps({this.stepDescription, this.figure1, this.stepDesc, this.stepTitle});

  Steps.fromJson(Map<String, dynamic> json) {
    stepTitle = json['step_title'];
    stepDescription = json['step_description'];
    figure1 = json['figure1'];
    stepDesc = json['step_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_title'] = this.stepTitle;
    data['step_description'] = this.stepDescription;
    data['figure1'] = this.figure1;
    data['step_desc'] = this.stepDesc;
    return data;
  }
}
