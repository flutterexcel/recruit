// To parse this JSON data, do
//
//     final jobPerformanceModel = jobPerformanceModelFromJson(jsonString);

import 'dart:convert';

List<List<JobPerformanceModel>> jobPerformanceModelFromJson(String str) =>
    List<List<JobPerformanceModel>>.from(json.decode(str).map((x) =>
        List<JobPerformanceModel>.from(
            x.map((x) => JobPerformanceModel.fromJson(x)))));

// String jobPerformanceModelToJson(List<List<JobPerformanceModel>> data) =>
//     json.encode(List<dynamic>.from(
//         data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class JobPerformanceModel {
  JobPerformanceModel({
    this.date,
    this.from,
    this.to,
    this.userId,
    this.employee,
    this.duration,
  });

  Date date;
  String from;
  String to;
  String userId;
  String employee;
  dynamic duration;

  factory JobPerformanceModel.fromJson(Map<String, dynamic> json) =>
      JobPerformanceModel(
        date: dateValues.map[json["date"]],
        from: json["from"] == null ? null : json["from"],
        to: json["to"] == null ? null : json["to"],
        userId: json["userId"],
        employee: json["employee"] == null ? null : json["employee"],
        duration: json["duration"],
      );

  // Map<String, dynamic> toJson() => {
  //       "date": dateValues.reverse[date],
  //       "from": from == null ? null : from,
  //       "to": to == null ? null : to,
  //       "userId": userId,
  //       "employee": employee,
  //       "duration": duration,
  //     };
}

enum Date {
  WED_JAN_262022,
  THU_JAN_272022,
  FRI_JAN_282022,
  SAT_JAN_292022,
  SUN_JAN_302022,
  MON_JAN_312022,
  TUE_FEB_012022,
  WED_FEB_022022
}

final dateValues = EnumValues({
  "Fri Jan 28 2022": Date.FRI_JAN_282022,
  "Mon Jan 31 2022": Date.MON_JAN_312022,
  "Sat Jan 29 2022": Date.SAT_JAN_292022,
  "Sun Jan 30 2022": Date.SUN_JAN_302022,
  "Thu Jan 27 2022": Date.THU_JAN_272022,
  "Tue Feb 01 2022": Date.TUE_FEB_012022,
  "Wed Feb 02 2022": Date.WED_FEB_022022,
  "Wed Jan 26 2022": Date.WED_JAN_262022
});

enum DurationEnum { NO_DATA_AVAILABLE }

final durationEnumValues =
    EnumValues({"No Data Available": DurationEnum.NO_DATA_AVAILABLE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
