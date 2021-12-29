// import 'dart:convert';

// class JobList {
//     JobList({
//         this.assignToAllEmails,
//         this.jobDescription,
//         this.criteria,
//         this.activeStatus,
//         this.noOfJobOpenings,
//         this.skills,
//         this.interviewUnattended,
//         this.hiredUnattended,
//         this.holdUnattended,
//         this.unreadCandidate,
//         this.id,
//         this.subject,
//         this.email,
//         this.to,
//         this.keyword,
//         this.domain,
//         this.title,
//         this.candidateProfile,
//         this.position,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.activateCron,
//         this.isCriteriaUpdated,
//         this.automation,
//         this.automationScore,
//         this.automationTag,
//         this.automationType,
//         this.automationTypeDetails,
//         this.mailTemplateForAutomation,
//         this.testPaperId,
//         this.jobListId,
//         this.totalEmails,
//         this.unreadEmails,
//         this.userDetail,
//     });

//     bool assignToAllEmails;
//     String jobDescription;
//     Criteria criteria;
//     bool activeStatus;
//     int noOfJobOpenings;
//     List<dynamic> skills;
//     List<String> interviewUnattended;
//     List<String> hiredUnattended;
//     List<String> holdUnattended;
//     List<String> unreadCandidate;
//     String id;
//     String subject;
//     dynamic email;
//     dynamic to;
//     dynamic keyword;
//     String domain;
//     String title;
//     String candidateProfile;
//     int position;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;
//     bool activateCron;
//     bool isCriteriaUpdated;
//     bool automation;
//     double automationScore;
//     String automationTag;
//     String automationType;
//     AutomationTypeDetails automationTypeDetails;
//     String mailTemplateForAutomation;
//     String testPaperId;
//     String jobListId;
//     int totalEmails;
//     int unreadEmails;
//     List<UserDetail> userDetail;

//     factory JobList.fromRawJson(String str) => JobList.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory JobList.fromJson(Map<String, dynamic> json) => JobList(
//         assignToAllEmails: json["assign_to_all_emails"] == null ? null : json["assign_to_all_emails"],
//         jobDescription: json["job_description"] == null ? null : json["job_description"],
//         criteria: json["criteria"] == null ? null : Criteria.fromJson(json["criteria"]),
//         activeStatus: json["active_status"] == null ? null : json["active_status"],
//         noOfJobOpenings: json["no_of_job_openings"] == null ? null : json["no_of_job_openings"],
//         skills: json["skills"] == null ? null : List<dynamic>.from(json["skills"].map((x) => x)),
//         interviewUnattended: json["interviewUnattended"] == null ? null : List<String>.from(json["interviewUnattended"].map((x) => x)),
//         hiredUnattended: json["hiredUnattended"] == null ? null : List<String>.from(json["hiredUnattended"].map((x) => x)),
//         holdUnattended: json["holdUnattended"] == null ? null : List<String>.from(json["holdUnattended"].map((x) => x)),
//         unreadCandidate: json["unreadCandidate"] == null ? null : List<String>.from(json["unreadCandidate"].map((x) => x)),
//         id: json["_id"] == null ? null : json["_id"],
//         subject: json["subject"] == null ? null : json["subject"],
//         email: json["email"],
//         to: json["to"],
//         keyword: json["keyword"],
//         domain: json["domain"] == null ? null : json["domain"],
//         title: json["title"] == null ? null : json["title"],
//         candidateProfile: json["candidate_profile"] == null ? null : json["candidate_profile"],
//         position: json["position"] == null ? null : json["position"],
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"] == null ? null : json["__v"],
//         activateCron: json["activateCron"] == null ? null : json["activateCron"],
//         isCriteriaUpdated: json["is_criteria_updated"] == null ? null : json["is_criteria_updated"],
//         automation: json["automation"] == null ? null : json["automation"],
//         automationScore: json["automationScore"] == null ? null : json["automationScore"].toDouble(),
//         automationTag: json["automationTag"] == null ? null : json["automationTag"],
//         automationType: json["automationType"] == null ? null : json["automationType"],
//         automationTypeDetails: json["automationTypeDetails"] == null ? null : AutomationTypeDetails.fromJson(json["automationTypeDetails"]),
//         mailTemplateForAutomation: json["mailTemplateForAutomation"] == null ? null : json["mailTemplateForAutomation"],
//         testPaperId: json["test_paper_id"] == null ? null : json["test_paper_id"],
//         jobListId: json["id"] == null ? null : json["id"],
//         totalEmails: json["total_emails"] == null ? null : json["total_emails"],
//         unreadEmails: json["unread_emails"] == null ? null : json["unread_emails"],
//         userDetail: json["userDetail"] == null ? null : List<UserDetail>.from(json["userDetail"].map((x) => UserDetail.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "assign_to_all_emails": assignToAllEmails == null ? null : assignToAllEmails,
//         "job_description": jobDescription == null ? null : jobDescription,
//         "criteria": criteria == null ? null : criteria.toJson(),
//         "active_status": activeStatus == null ? null : activeStatus,
//         "no_of_job_openings": noOfJobOpenings == null ? null : noOfJobOpenings,
//         "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x)),
//         "interviewUnattended": interviewUnattended == null ? null : List<dynamic>.from(interviewUnattended.map((x) => x)),
//         "hiredUnattended": hiredUnattended == null ? null : List<dynamic>.from(hiredUnattended.map((x) => x)),
//         "holdUnattended": holdUnattended == null ? null : List<dynamic>.from(holdUnattended.map((x) => x)),
//         "unreadCandidate": unreadCandidate == null ? null : List<dynamic>.from(unreadCandidate.map((x) => x)),
//         "_id": id == null ? null : id,
//         "subject": subject == null ? null : subject,
//         "email": email,
//         "to": to,
//         "keyword": keyword,
//         "domain": domain == null ? null : domain,
//         "title": title == null ? null : title,
//         "candidate_profile": candidateProfile == null ? null : candidateProfile,
//         "position": position == null ? null : position,
//         "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
//         "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
//         "__v": v == null ? null : v,
//         "activateCron": activateCron == null ? null : activateCron,
//         "is_criteria_updated": isCriteriaUpdated == null ? null : isCriteriaUpdated,
//         "automation": automation == null ? null : automation,
//         "automationScore": automationScore == null ? null : automationScore,
//         "automationTag": automationTag == null ? null : automationTag,
//         "automationType": automationType == null ? null : automationType,
//         "automationTypeDetails": automationTypeDetails == null ? null : automationTypeDetails.toJson(),
//         "mailTemplateForAutomation": mailTemplateForAutomation == null ? null : mailTemplateForAutomation,
//         "test_paper_id": testPaperId == null ? null : testPaperId,
//         "id": jobListId == null ? null : jobListId,
//         "total_emails": totalEmails == null ? null : totalEmails,
//         "unread_emails": unreadEmails == null ? null : unreadEmails,
//         "userDetail": userDetail == null ? null : List<dynamic>.from(userDetail.map((x) => x.toJson())),
//     };
// }

// class AutomationTypeDetails {
//     AutomationTypeDetails({
//         this.initialTag,
//         this.labelPreferred,
//         this.labels,
//         this.finalTag,
//         this.initialTemplate,
//         this.finalTemplate,
//         this.passingPercentage,
//     });

//     String initialTag;
//     String labelPreferred;
//     List<String> labels;
//     String finalTag;
//     String initialTemplate;
//     String finalTemplate;
//     int passingPercentage;

//     factory AutomationTypeDetails.fromRawJson(String str) => AutomationTypeDetails.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory AutomationTypeDetails.fromJson(Map<String, dynamic> json) => AutomationTypeDetails(
//         initialTag: json["initialTag"] == null ? null : json["initialTag"],
//         labelPreferred: json["labelPreferred"] == null ? null : json["labelPreferred"],
//         labels: json["labels"] == null ? null : List<String>.from(json["labels"].map((x) => x)),
//         finalTag: json["finalTag"] == null ? null : json["finalTag"],
//         initialTemplate: json["initialTemplate"] == null ? null : json["initialTemplate"],
//         finalTemplate: json["finalTemplate"] == null ? null : json["finalTemplate"],
//         passingPercentage: json["passingPercentage"] == null ? null : json["passingPercentage"],
//     );

//     Map<String, dynamic> toJson() => {
//         "initialTag": initialTag == null ? null : initialTag,
//         "labelPreferred": labelPreferred == null ? null : labelPreferred,
//         "labels": labels == null ? null : List<dynamic>.from(labels.map((x) => x)),
//         "finalTag": finalTag == null ? null : finalTag,
//         "initialTemplate": initialTemplate == null ? null : initialTemplate,
//         "finalTemplate": finalTemplate == null ? null : finalTemplate,
//         "passingPercentage": passingPercentage == null ? null : passingPercentage,
//     };
// }

// class Criteria {
//     Criteria({
//         this.experience,
//         this.skills,
//         this.education,
//         this.passoutYear,
//         this.location,
//         this.dob,
//         this.basic,
//     });

//     Dob experience;
//     Location skills;
//     Dob education;
//     Location passoutYear;
//     Location location;
//     Dob dob;
//     bool basic;

//     factory Criteria.fromRawJson(String str) => Criteria.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Criteria.fromJson(Map<String, dynamic> json) => Criteria(
//         experience: json["experience"] == null ? null : Dob.fromJson(json["experience"]),
//         skills: json["skills"] == null ? null : Location.fromJson(json["skills"]),
//         education: json["education"] == null ? null : Dob.fromJson(json["education"]),
//         passoutYear: json["passoutYear"] == null ? null : Location.fromJson(json["passoutYear"]),
//         location: json["location"] == null ? null : Location.fromJson(json["location"]),
//         dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
//         basic: json["basic"] == null ? null : json["basic"],
//     );

//     Map<String, dynamic> toJson() => {
//         "experience": experience == null ? null : experience.toJson(),
//         "skills": skills == null ? null : skills.toJson(),
//         "education": education == null ? null : education.toJson(),
//         "passoutYear": passoutYear == null ? null : passoutYear.toJson(),
//         "location": location == null ? null : location.toJson(),
//         "dob": dob == null ? null : dob.toJson(),
//         "basic": basic == null ? null : basic,
//     };
// }

// class Dob {
//     Dob({
//         this.values,
//         this.weight,
//     });

//     List<DobValue> values;
//     int weight;

//     factory Dob.fromRawJson(String str) => Dob.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Dob.fromJson(Map<String, dynamic> json) => Dob(
//         values: json["values"] == null ? null : List<DobValue>.from(json["values"].map((x) => DobValue.fromJson(x))),
//         weight: json["weight"] == null ? null : json["weight"],
//     );

//     Map<String, dynamic> toJson() => {
//         "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
//         "weight": weight == null ? null : weight,
//     };
// }

// class DobValue {
//     DobValue({
//         this.min,
//         this.max,
//         this.weight,
//         this.id,
//     });

//     String min;
//     String max;
//     int weight;
//     int id;

//     factory DobValue.fromRawJson(String str) => DobValue.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory DobValue.fromJson(Map<String, dynamic> json) => DobValue(
//         min: json["min"] == null ? null : json["min"].toString(),
//         max: json["max"] == null ? null : json["max"],
//         weight: json["weight"] == null ? null : json["weight"],
//         id: json["id"] == null ? null : json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "min": min == null ? null : min,
//         "max": max == null ? null : max,
//         "weight": weight == null ? null : weight,
//         "id": id == null ? null : id,
//     };
// }

// class Location {
//     Location({
//         this.values,
//         this.weight,
//     });

//     List<LocationValue> values;
//     int weight;

//     factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Location.fromJson(Map<String, dynamic> json) => Location(
//         values: json["values"] == null ? null : List<LocationValue>.from(json["values"].map((x) => LocationValue.fromJson(x))),
//         weight: json["weight"] == null ? null : json["weight"],
//     );

//     Map<String, dynamic> toJson() => {
//         "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
//         "weight": weight == null ? null : weight,
//     };
// }

// class LocationValue {
//     LocationValue({
//         this.value,
//         this.weight,
//     });

//     String value;
//     int weight;

//     factory LocationValue.fromRawJson(String str) => LocationValue.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory LocationValue.fromJson(Map<String, dynamic> json) => LocationValue(
//         value: json["value"] == null ? null : json["value"],
//         weight: json["weight"] == null ? null : json["weight"],
//     );

//     Map<String, dynamic> toJson() => {
//         "value": value == null ? null : value,
//         "weight": weight == null ? null : weight,
//     };
// }

// class UserDetail {
//     UserDetail({
//         this.id,
//         this.name,
//         this.email,
//         this.imageUrl,
//         this.userType,
//     });

//     String id;
//     String name;
//     String email;
//     String imageUrl;
//     String userType;

//     factory UserDetail.fromRawJson(String str) => UserDetail.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         email: json["email"] == null ? null : json["email"],
//         imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
//         userType: json["user_type"] == null ? null : json["user_type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "email": email == null ? null : email,
//         "imageUrl": imageUrl == null ? null : imageUrl,
//         "user_type": userType == null ? null : userType,
//     };
// }

// To parse this JSON data, do
//
//     final jobList = jobListFromJson(jsonString);

import 'dart:convert';

class JobList {
    JobList({
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
        this.jobListId,
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
    List<String> interviewUnattended;
    List<String> hiredUnattended;
    List<String> holdUnattended;
    List<String> unreadCandidate;
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
    double automationScore;
    String automationTag;
    String automationType;
    AutomationTypeDetails automationTypeDetails;
    String mailTemplateForAutomation;
    String testPaperId;
    String jobListId;
    int totalEmails;
    int unreadEmails;
    List<UserDetail> userDetail;

    factory JobList.fromRawJson(String str) => JobList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JobList.fromJson(Map<String, dynamic> json) => JobList(
        assignToAllEmails: json["assign_to_all_emails"] == null ? null : json["assign_to_all_emails"],
        jobDescription: json["job_description"] == null ? null : json["job_description"],
        criteria: json["criteria"] == null ? null : Criteria.fromJson(json["criteria"]),
        activeStatus: json["active_status"] == null ? null : json["active_status"],
        noOfJobOpenings: json["no_of_job_openings"] == null ? null : json["no_of_job_openings"],
        skills: json["skills"] == null ? null : List<dynamic>.from(json["skills"].map((x) => x)),
        interviewUnattended: json["interviewUnattended"] == null ? null : List<String>.from(json["interviewUnattended"].map((x) => x)),
        hiredUnattended: json["hiredUnattended"] == null ? null : List<String>.from(json["hiredUnattended"].map((x) => x)),
        holdUnattended: json["holdUnattended"] == null ? null : List<String>.from(json["holdUnattended"].map((x) => x)),
        unreadCandidate: json["unreadCandidate"] == null ? null : List<String>.from(json["unreadCandidate"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        subject: json["subject"] == null ? null : json["subject"],
        email: json["email"],
        to: json["to"],
        keyword: json["keyword"],
        domain: json["domain"] == null ? null : json["domain"],
        title: json["title"] == null ? null : json["title"],
        candidateProfile: json["candidate_profile"] == null ? null : json["candidate_profile"],
        position: json["position"] == null ? null : json["position"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        activateCron: json["activateCron"] == null ? null : json["activateCron"],
        isCriteriaUpdated: json["is_criteria_updated"] == null ? null : json["is_criteria_updated"],
        automation: json["automation"] == null ? null : json["automation"],
        automationScore: json["automationScore"] == null ? null : json["automationScore"].toDouble(),
        automationTag: json["automationTag"] == null ? null : json["automationTag"],
        automationType: json["automationType"] == null ? null : json["automationType"],
        automationTypeDetails: json["automationTypeDetails"] == null ? null : AutomationTypeDetails.fromJson(json["automationTypeDetails"]),
        mailTemplateForAutomation: json["mailTemplateForAutomation"] == null ? null : json["mailTemplateForAutomation"],
        testPaperId: json["test_paper_id"] == null ? null : json["test_paper_id"],
        jobListId: json["id"] == null ? null : json["id"],
        totalEmails: json["total_emails"] == null ? null : json["total_emails"],
        unreadEmails: json["unread_emails"] == null ? null : json["unread_emails"],
        userDetail: json["userDetail"] == null ? null : List<UserDetail>.from(json["userDetail"].map((x) => UserDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "assign_to_all_emails": assignToAllEmails == null ? null : assignToAllEmails,
        "job_description": jobDescription == null ? null : jobDescription,
        "criteria": criteria == null ? null : criteria.toJson(),
        "active_status": activeStatus == null ? null : activeStatus,
        "no_of_job_openings": noOfJobOpenings == null ? null : noOfJobOpenings,
        "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x)),
        "interviewUnattended": interviewUnattended == null ? null : List<dynamic>.from(interviewUnattended.map((x) => x)),
        "hiredUnattended": hiredUnattended == null ? null : List<dynamic>.from(hiredUnattended.map((x) => x)),
        "holdUnattended": holdUnattended == null ? null : List<dynamic>.from(holdUnattended.map((x) => x)),
        "unreadCandidate": unreadCandidate == null ? null : List<dynamic>.from(unreadCandidate.map((x) => x)),
        "_id": id == null ? null : id,
        "subject": subject == null ? null : subject,
        "email": email,
        "to": to,
        "keyword": keyword,
        "domain": domain == null ? null : domain,
        "title": title == null ? null : title,
        "candidate_profile": candidateProfile == null ? null : candidateProfile,
        "position": position == null ? null : position,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "activateCron": activateCron == null ? null : activateCron,
        "is_criteria_updated": isCriteriaUpdated == null ? null : isCriteriaUpdated,
        "automation": automation == null ? null : automation,
        "automationScore": automationScore == null ? null : automationScore,
        "automationTag": automationTag == null ? null : automationTag,
        "automationType": automationType == null ? null : automationType,
        "automationTypeDetails": automationTypeDetails == null ? null : automationTypeDetails.toJson(),
        "mailTemplateForAutomation": mailTemplateForAutomation == null ? null : mailTemplateForAutomation,
        "test_paper_id": testPaperId == null ? null : testPaperId,
        "id": jobListId == null ? null : jobListId,
        "total_emails": totalEmails == null ? null : totalEmails,
        "unread_emails": unreadEmails == null ? null : unreadEmails,
        "userDetail": userDetail == null ? null : List<dynamic>.from(userDetail.map((x) => x.toJson())),
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
    dynamic passingPercentage;

    factory AutomationTypeDetails.fromRawJson(String str) => AutomationTypeDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AutomationTypeDetails.fromJson(Map<String, dynamic> json) => AutomationTypeDetails(
        initialTag: json["initialTag"] == null ? null : json["initialTag"],
        labelPreferred: json["labelPreferred"] == null ? null : json["labelPreferred"],
        labels: json["labels"] == null ? null : List<String>.from(json["labels"].map((x) => x)),
        finalTag: json["finalTag"] == null ? null : json["finalTag"],
        initialTemplate: json["initialTemplate"] == null ? null : json["initialTemplate"],
        finalTemplate: json["finalTemplate"] == null ? null : json["finalTemplate"],
        passingPercentage: json["passingPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "initialTag": initialTag == null ? null : initialTag,
        "labelPreferred": labelPreferred == null ? null : labelPreferred,
        "labels": labels == null ? null : List<dynamic>.from(labels.map((x) => x)),
        "finalTag": finalTag == null ? null : finalTag,
        "initialTemplate": initialTemplate == null ? null : initialTemplate,
        "finalTemplate": finalTemplate == null ? null : finalTemplate,
        "passingPercentage": passingPercentage,
    };
}

class Criteria {
    Criteria({
        this.experience,
        this.skills,
        this.education,
        this.passoutYear,
        this.location,
        this.dob,
        this.basic,
        this.gender,
    });

    Experience experience;
    Skills skills;
    Education education;
    Location passoutYear;
    Location location;
    Dob dob;
    bool basic;
    Gender gender;

    factory Criteria.fromRawJson(String str) => Criteria.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Criteria.fromJson(Map<String, dynamic> json) => Criteria(
        experience: json["experience"] == null ? null : Experience.fromJson(json["experience"]),
        skills: json["skills"] == null ? null : Skills.fromJson(json["skills"]),
        education: json["education"] == null ? null : Education.fromJson(json["education"]),
        passoutYear: json["passoutYear"] == null ? null : Location.fromJson(json["passoutYear"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        basic: json["basic"] == null ? null : json["basic"],
        gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
    );

    Map<String, dynamic> toJson() => {
        "experience": experience == null ? null : experience.toJson(),
        "skills": skills == null ? null : skills.toJson(),
        "education": education == null ? null : education.toJson(),
        "passoutYear": passoutYear == null ? null : passoutYear.toJson(),
        "location": location == null ? null : location.toJson(),
        "dob": dob == null ? null : dob.toJson(),
        "basic": basic == null ? null : basic,
        "gender": gender == null ? null : gender.toJson(),
    };
}

class Dob {
    Dob({
        this.values,
        this.weight,
    });

    List<DobValue> values;
    int weight;

    factory Dob.fromRawJson(String str) => Dob.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        values: json["values"] == null ? null : List<DobValue>.from(json["values"].map((x) => DobValue.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight == null ? null : weight,
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

    factory DobValue.fromRawJson(String str) => DobValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DobValue.fromJson(Map<String, dynamic> json) => DobValue(
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
        weight: json["weight"] == null ? null : json["weight"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "min": min == null ? null : min,
        "max": max == null ? null : max,
        "weight": weight == null ? null : weight,
        "id": id == null ? null : id,
    };
}

class Education {
    Education({
        this.values,
        this.weight,
    });

    List<EducationValue> values;
    int weight;

    factory Education.fromRawJson(String str) => Education.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        values: json["values"] == null ? null : List<EducationValue>.from(json["values"].map((x) => EducationValue.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight == null ? null : weight,
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

    factory EducationValue.fromRawJson(String str) => EducationValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EducationValue.fromJson(Map<String, dynamic> json) => EducationValue(
        value: json["value"] == null ? null : json["value"],
        weight: json["weight"] == null ? null : json["weight"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "weight": weight == null ? null : weight,
        "type": type == null ? null : type,
    };
}

class Experience {
    Experience({
        this.values,
        this.weight,
    });

    List<ExperienceValue> values;
    int weight;

    factory Experience.fromRawJson(String str) => Experience.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        values: json["values"] == null ? null : List<ExperienceValue>.from(json["values"].map((x) => ExperienceValue.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight == null ? null : weight,
    };
}

class ExperienceValue {
    ExperienceValue({
        this.weight,
        this.id,
        this.min,
        this.max,
    });

    int weight;
    int id;
    int min;
    int max;

    factory ExperienceValue.fromRawJson(String str) => ExperienceValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ExperienceValue.fromJson(Map<String, dynamic> json) => ExperienceValue(
        weight: json["weight"] == null ? null : json["weight"],
        id: json["id"] == null ? null : json["id"],
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
    );

    Map<String, dynamic> toJson() => {
        "weight": weight == null ? null : weight,
        "id": id == null ? null : id,
        "min": min == null ? null : min,
        "max": max == null ? null : max,
    };
}

class Gender {
    Gender({
        this.value,
        this.weight,
    });

    String value;
    int weight;

    factory Gender.fromRawJson(String str) => Gender.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        value: json["value"] == null ? null : json["value"],
        weight: json["weight"] == null ? null : json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "weight": weight == null ? null : weight,
    };
}

class Location {
    Location({
        this.values,
        this.weight,
    });

    List<Gender> values;
    int weight;

    factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        values: json["values"] == null ? null : List<Gender>.from(json["values"].map((x) => Gender.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight == null ? null : weight,
    };
}

class Skills {
    Skills({
        this.values,
        this.weight,
    });

    List<SkillsValue> values;
    int weight;

    factory Skills.fromRawJson(String str) => Skills.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Skills.fromJson(Map<String, dynamic> json) => Skills(
        values: json["values"] == null ? null : List<SkillsValue>.from(json["values"].map((x) => SkillsValue.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "values": values == null ? null : List<dynamic>.from(values.map((x) => x.toJson())),
        "weight": weight == null ? null : weight,
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

    factory SkillsValue.fromRawJson(String str) => SkillsValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SkillsValue.fromJson(Map<String, dynamic> json) => SkillsValue(
        value: json["value"] == null ? null : json["value"],
        weight: json["weight"] == null ? null : json["weight"],
        hovered: json["hovered"] == null ? null : json["hovered"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "weight": weight == null ? null : weight,
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

    factory UserDetail.fromRawJson(String str) => UserDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        userType: json["user_type"] == null ? null : json["user_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "user_type": userType == null ? null : userType,
    };
}
