class JobsOverviewModel {
  String title;
  int count;
  String timestamp;

  JobsOverviewModel({this.title, this.count, this.timestamp});

  JobsOverviewModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    count = json['count'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['count'] = this.count;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
