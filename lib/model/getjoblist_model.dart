// To parse this JSON data, do
//
//     final getJobListModel = getJobListModelFromJson(jsonString);

import 'dart:convert';

List<GetJobListModel> getJobListModelFromJson(String str) =>
    List<GetJobListModel>.from(
        json.decode(str).map((x) => GetJobListModel.fromJson(x)));

String getJobListModelToJson(List<GetJobListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetJobListModel {
  GetJobListModel({
    this.assignToAllEmails,
    this.jobDescription,
    this.criteria,
    this.activeStatus,
    this.noOfJobOpenings,
    this.skills,
    this.interviewUnattended,
    this.hiredUnattended,
    this.holdUnattended,
    this.unreadCandidate,
    this.automationActive,
    this.id,
    this.subject,
    this.email,
    this.to,
    this.keyword,
    this.domain,
    this.title,
    this.candidateProfile,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.activateCron,
    this.isCriteriaUpdated,
    this.automation,
    this.automationScore,
    this.automationTag,
    this.automationType,
    this.automationTypeDetails,
    this.mailTemplateForAutomation,
    this.testPaperId,
    this.getJobListModelId,
    this.totalEmails,
    this.unreadEmails,
    this.userDetail,
  });

  bool assignToAllEmails;
  String jobDescription;
  Criteria criteria;
  bool activeStatus;
  int noOfJobOpenings;
  List<dynamic> skills;
  List<dynamic> interviewUnattended;
  List<dynamic> hiredUnattended;
  List<dynamic> holdUnattended;
  List<dynamic> unreadCandidate;
  bool automationActive;
  String id;
  String subject;
  dynamic email;
  dynamic to;
  dynamic keyword;
  String domain;
  String title;
  String candidateProfile;
  int position;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  bool activateCron;
  bool isCriteriaUpdated;
  bool automation;
  int automationScore;
  String automationTag;
  String automationType;
  AutomationTypeDetails automationTypeDetails;
  String mailTemplateForAutomation;
  String testPaperId;
  String getJobListModelId;
  int totalEmails;
  int unreadEmails;
  List<UserDetail> userDetail;

  factory GetJobListModel.fromJson(Map<String, dynamic> json) =>
      GetJobListModel(
        assignToAllEmails: json["assign_to_all_emails"],
        jobDescription: json["job_description"],
        criteria: json["criteria"] == null
            ? null
            : Criteria.fromJson(json["criteria"]),
        activeStatus: json["active_status"],
        noOfJobOpenings: json["no_of_job_openings"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        interviewUnattended:
            List<dynamic>.from(json["interviewUnattended"].map((x) => x)),
        hiredUnattended:
            List<dynamic>.from(json["hiredUnattended"].map((x) => x)),
        holdUnattended:
            List<dynamic>.from(json["holdUnattended"].map((x) => x)),
        unreadCandidate:
            List<dynamic>.from(json["unreadCandidate"].map((x) => x)),
        automationActive: json["automation_active"],
        id: json["_id"],
        subject: json["subject"],
        email: json["email"],
        to: json["to"],
        keyword: json["keyword"],
        domain: json["domain"],
        title: json["title"],
        candidateProfile: json["candidate_profile"],
        position: json["position"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        activateCron: json["activateCron"],
        isCriteriaUpdated: json["is_criteria_updated"] == null
            ? null
            : json["is_criteria_updated"],
        automation: json["automation"] == null ? null : json["automation"],
        automationScore:
            json["automationScore"] == null ? null : json["automationScore"],
        automationTag:
            json["automationTag"] == null ? null : json["automationTag"],
        automationType:
            json["automationType"] == null ? null : json["automationType"],
        automationTypeDetails: json["automationTypeDetails"] == null
            ? null
            : AutomationTypeDetails.fromJson(json["automationTypeDetails"]),
        mailTemplateForAutomation: json["mailTemplateForAutomation"] == null
            ? null
            : json["mailTemplateForAutomation"],
        testPaperId:
            json["test_paper_id"] == null ? null : json["test_paper_id"],
        getJobListModelId: json["id"],
        totalEmails: json["total_emails"],
        unreadEmails: json["unread_emails"],
        userDetail: List<UserDetail>.from(
            json["userDetail"].map((x) => UserDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "assign_to_all_emails": assignToAllEmails,
        "job_description": jobDescription,
        "criteria": criteria == null ? null : criteria.toJson(),
        "active_status": activeStatus,
        "no_of_job_openings": noOfJobOpenings,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "interviewUnattended":
            List<dynamic>.from(interviewUnattended.map((x) => x)),
        "hiredUnattended": List<dynamic>.from(hiredUnattended.map((x) => x)),
        "holdUnattended": List<dynamic>.from(holdUnattended.map((x) => x)),
        "unreadCandidate": List<dynamic>.from(unreadCandidate.map((x) => x)),
        "automation_active": automationActive,
        "_id": id,
        "subject": subject,
        "email": email,
        "to": to,
        "keyword": keyword,
        "domain": domain,
        "title": title,
        "candidate_profile": candidateProfile,
        "position": position,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "activateCron": activateCron,
        "is_criteria_updated":
            isCriteriaUpdated == null ? null : isCriteriaUpdated,
        "automation": automation == null ? null : automation,
        "automationScore": automationScore == null ? null : automationScore,
        "automationTag": automationTag == null ? null : automationTag,
        "automationType": automationType == null ? null : automationType,
        "automationTypeDetails": automationTypeDetails == null
            ? null
            : automationTypeDetails.toJson(),
        "mailTemplateForAutomation": mailTemplateForAutomation == null
            ? null
            : mailTemplateForAutomation,
        "test_paper_id": testPaperId == null ? null : testPaperId,
        "id": getJobListModelId,
        "total_emails": totalEmails,
        "unread_emails": unreadEmails,
        "userDetail": List<dynamic>.from(userDetail.map((x) => x.toJson())),
      };
}

class AutomationTypeDetails {
  AutomationTypeDetails({
    this.initialTag,
    this.labelPreferred,
    this.labels,
    this.finalTag,
    this.initialTemplate,
    this.finalTemplate,
    this.passingPercentage,
  });

  String initialTag;
  String labelPreferred;
  List<String> labels;
  String finalTag;
  String initialTemplate;
  String finalTemplate;
  String passingPercentage;

  factory AutomationTypeDetails.fromJson(Map<String, dynamic> json) =>
      AutomationTypeDetails(
        initialTag: json["initialTag"],
        labelPreferred: json["labelPreferred"],
        labels: List<String>.from(json["labels"].map((x) => x)),
        finalTag: json["finalTag"],
        initialTemplate: json["initialTemplate"],
        finalTemplate: json["finalTemplate"],
        passingPercentage: json["passingPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "initialTag": initialTag,
        "labelPreferred": labelPreferred,
        "labels": List<dynamic>.from(labels.map((x) => x)),
        "finalTag": finalTag,
        "initialTemplate": initialTemplate,
        "finalTemplate": finalTemplate,
        "passingPercentage": passingPercentage,
      };
}

class Criteria {
  Criteria({
    this.experience,
    this.gender,
    this.skills,
    this.education,
    this.passoutYear,
    this.location,
    this.dob,
    this.basic,
  });

  Dob experience;
  Gender gender;
  Skills skills;
  Education education;
  Location passoutYear;
  Location location;
  Dob dob;
  bool basic;

  factory Criteria.fromJson(Map<String, dynamic> json) => Criteria(
        experience: Dob.fromJson(json["experience"]),
        gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
        skills: Skills.fromJson(json["skills"]),
        education: Education.fromJson(json["education"]),
        passoutYear: Location.fromJson(json["passoutYear"]),
        location: Location.fromJson(json["location"]),
        dob: Dob.fromJson(json["dob"]),
        basic: json["basic"],
      );

  Map<String, dynamic> toJson() => {
        "experience": experience.toJson(),
        "gender": gender == null ? null : gender.toJson(),
        "skills": skills.toJson(),
        "education": education.toJson(),
        "passoutYear": passoutYear.toJson(),
        "location": location.toJson(),
        "dob": dob.toJson(),
        "basic": basic,
      };
}

class Dob {
  Dob({
    this.values,
    this.weight,
  });

  List<DobValue> values;
  int weight;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        values: List<DobValue>.from(
            json["values"].map((x) => DobValue.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight,
      };
}

class DobValue {
  DobValue({
    this.min,
    this.max,
    this.weight,
    this.id,
  });

  String min;
  String max;
  int weight;
  int id;

  factory DobValue.fromJson(Map<String, dynamic> json) => DobValue(
        min: json["min"],
        max: json["max"],
        weight: json["weight"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
        "weight": weight,
        "id": id,
      };
}

class Education {
  Education({
    this.values,
    this.weight,
  });

  List<EducationValue> values;
  int weight;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        values: List<EducationValue>.from(
            json["values"].map((x) => EducationValue.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight,
      };
}

class EducationValue {
  EducationValue({
    this.value,
    this.weight,
    this.type,
  });

  String value;
  int weight;
  String type;

  factory EducationValue.fromJson(Map<String, dynamic> json) => EducationValue(
        value: json["value"],
        weight: json["weight"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "weight": weight,
        "type": type,
      };
}

class Gender {
  Gender({
    this.value,
    this.weight,
  });

  String value;
  int weight;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        value: json["value"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "weight": weight,
      };
}

class Location {
  Location({
    this.values,
    this.weight,
  });

  List<Gender> values;
  int weight;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        values:
            List<Gender>.from(json["values"].map((x) => Gender.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Skills {
  Skills({
    this.values,
    this.weight,
  });

  List<SkillsValue> values;
  int weight;

  factory Skills.fromJson(Map<String, dynamic> json) => Skills(
        values: List<SkillsValue>.from(
            json["values"].map((x) => SkillsValue.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight,
      };
}

class SkillsValue {
  SkillsValue({
    this.value,
    this.weight,
    this.hovered,
  });

  String value;
  int weight;
  bool hovered;

  factory SkillsValue.fromJson(Map<String, dynamic> json) => SkillsValue(
        value: json["value"],
        weight: json["weight"],
        hovered: json["hovered"] == null ? null : json["hovered"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "weight": weight,
        "hovered": hovered == null ? null : hovered,
      };
}

class UserDetail {
  UserDetail({
    this.id,
    this.name,
    this.email,
    this.imageUrl,
    this.userType,
  });

  String id;
  String name;
  String email;
  String imageUrl;
  String userType;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "imageUrl": imageUrl,
        "user_type": userType,
      };
}
