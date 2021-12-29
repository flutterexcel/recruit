// To parse this JSON data, do
//
//     final jobTag = jobTagFromJson(jsonString);

import 'dart:convert';

class JobTag {
    JobTag({
        this.assignToAllEmails,
        this.activeStatus,
        this.parentId,
        this.id,
        this.title,
        this.sequence,
        this.jobTagDefault,
        this.jobTagId,
        this.read,
        this.unread,
        this.count,
        this.roundDetails,
        this.inheritedFrom,
        this.inheritedFromName,
        this.testPaperId,
    });

    bool assignToAllEmails;
    bool activeStatus;
    String parentId;
    String id;
    String title;
    int sequence;
    bool jobTagDefault;
    String jobTagId;
    int read;
    int unread;
    int count;
    List<JobTag> roundDetails;
    String inheritedFrom;
    String inheritedFromName;
    String testPaperId;

    factory JobTag.fromRawJson(String str) => JobTag.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JobTag.fromJson(Map<String, dynamic> json) => JobTag(
        assignToAllEmails: json["assign_to_all_emails"] == null ? null : json["assign_to_all_emails"],
        activeStatus: json["active_status"] == null ? null : json["active_status"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        sequence: json["sequence"] == null ? null : json["sequence"],
        jobTagDefault: json["default"] == null ? null : json["default"],
        jobTagId: json["id"] == null ? null : json["id"],
        read: json["read"] == null ? null : json["read"],
        unread: json["unread"] == null ? null : json["unread"],
        count: json["count"] == null ? null : json["count"],
        roundDetails: json["roundDetails"] == null ? null : List<JobTag>.from(json["roundDetails"].map((x) => JobTag.fromJson(x))),
        inheritedFrom: json["inherited_from"] == null ? null : json["inherited_from"],
        inheritedFromName: json["inherited_from_name"] == null ? null : json["inherited_from_name"],
        testPaperId: json["test_paper_id"] == null ? null : json["test_paper_id"],
    );

    Map<String, dynamic> toJson() => {
        "assign_to_all_emails": assignToAllEmails == null ? null : assignToAllEmails,
        "active_status": activeStatus == null ? null : activeStatus,
        "parent_id": parentId == null ? null : parentId,
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "sequence": sequence == null ? null : sequence,
        "default": jobTagDefault == null ? null : jobTagDefault,
        "id": jobTagId == null ? null : jobTagId,
        "read": read == null ? null : read,
        "unread": unread == null ? null : unread,
        "count": count == null ? null : count,
        "roundDetails": roundDetails == null ? null : List<dynamic>.from(roundDetails.map((x) => x.toJson())),
        "inherited_from": inheritedFrom == null ? null : inheritedFrom,
        "inherited_from_name": inheritedFromName == null ? null : inheritedFromName,
        "test_paper_id": testPaperId == null ? null : testPaperId,
    };
}

class ListJobTag {
  List<JobTag> listJobTag;
  ListJobTag({this.listJobTag});
}
