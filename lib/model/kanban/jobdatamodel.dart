import 'dart:convert';

class JobTagData {
  JobTagData({
    this.data,
    this.read,
    this.unread,
  });

  List<Datum> data;
  int read;
  int unread;

  factory JobTagData.fromRawJson(String str) =>
      JobTagData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobTagData.fromJson(Map<String, dynamic> json) => JobTagData(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        read: json["read"] == null ? null : json["read"],
        unread: json["unread"] == null ? null : json["unread"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "read": read == null ? null : read,
        "unread": unread == null ? null : unread,
      };
}

class Datum {
  Datum({
    this.v,
    this.id,
    this.automationMail,
    this.automationProcess,
    this.callingDetails,
    this.candidate,
    this.candidateScore,
    this.candidateSubTagsMovement,
    this.candidateId,
    this.candidateStar,
    this.changebyname,
    this.conversation,
    this.createdAt,
    this.cvData,
    this.cvParsedAi,
    this.cvParsedStatus,
    this.cvTimeStampAi,
    this.cvimage,
    this.dailyMail,
    this.date,
    this.emailDate,
    this.emailTimestamp,
    this.finalEntity,
    this.from,
    this.holdReasonData,
    this.imapEmail,
    this.index,
    this.interview,
    this.interviewType,
    this.interviewee,
    this.isArchieved,
    this.isAttachment,
    this.isAutomaticEmailSend,
    this.jobProfileId,
    this.lastMailDate,
    this.lastMailDetails,
    this.lastTemplateKey,
    this.lastActivityDate,
    this.manualEmail,
    this.mobileNo,
    this.notes,
    this.orgName,
    this.readByUser,
    this.readEmailTime,
    this.referee,
    this.rejectReasonData,
    this.reminderCount,
    this.replyReminder,
    this.reviewedParsedCvBy,
    this.scheduleDate,
    this.scheduleFor,
    this.scheduleTime,
    this.sendTemplateCount,
    this.senderMail,
    this.sequence,
    this.skills,
    this.socketMessage,
    this.subject,
    this.tagId,
    this.templateId,
    this.to,
    this.uid,
    this.unread,
    this.updatedAt,
    this.updatedTime,
    this.datumUpdatedTime,
  });

  int v;
  String id;
  AutomationMail automationMail;
  String automationProcess;
  List<dynamic> callingDetails;
  bool candidate;
  double candidateScore;
  CandidateSubTagsMovement candidateSubTagsMovement;
  String candidateId;
  List<dynamic> candidateStar;
  dynamic changebyname;
  bool conversation;
  DateTime createdAt;
  dynamic cvData;
  bool cvParsedAi;
  bool cvParsedStatus;
  CvTimeStampAi cvTimeStampAi;
  Cvimage cvimage;
  bool dailyMail;
  DateTime date;
  DateTime emailDate;
  String emailTimestamp;
  FinalEntity finalEntity;
  String from;
  List<HoldReasonData> holdReasonData;
  String imapEmail;
  dynamic index;
  List<InterviewElement> interview;
  String interviewType;
  List<dynamic> interviewee;
  bool isArchieved;
  bool isAttachment;
  int isAutomaticEmailSend;
  String jobProfileId;
  DateTime lastMailDate;
  LastMailDetails lastMailDetails;
  String lastTemplateKey;
  DateTime lastActivityDate;
  bool manualEmail;
  dynamic mobileNo;
  List<dynamic> notes;
  String orgName;
  String readByUser;
  DateTime readEmailTime;
  String referee;
  List<RejectReasonData> rejectReasonData;
  int reminderCount;
  bool replyReminder;
  List<dynamic> reviewedParsedCvBy;
  dynamic scheduleDate;
  String scheduleFor;
  String scheduleTime;
  int sendTemplateCount;
  String senderMail;
  int sequence;
  List<dynamic> skills;
  String socketMessage;
  String subject;
  String tagId;
  List<dynamic> templateId;
  String to;
  String uid;
  bool unread;
  DateTime updatedAt;
  DateTime updatedTime;
  DateTime datumUpdatedTime;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        v: json["__v"] == null ? null : json["__v"],
        id: json["_id"] == null ? null : json["_id"],
        automationMail: json["automationMail"] == null
            ? null
            : AutomationMail.fromJson(json["automationMail"]),
        automationProcess: json["automationProcess"] == null
            ? null
            : json["automationProcess"],
        callingDetails: json["callingDetails"] == null
            ? null
            : List<dynamic>.from(json["callingDetails"].map((x) => x)),
        candidate: json["candidate"] == null ? null : json["candidate"],
        candidateScore: json["candidateScore"] == null
            ? null
            : json["candidateScore"].toDouble(),
        candidateSubTagsMovement: json["candidateSubTagsMovement"] == null
            ? null
            : CandidateSubTagsMovement.fromJson(
                json["candidateSubTagsMovement"]),
        candidateId: json["candidate_id"] == null ? null : json["candidate_id"],
        candidateStar: json["candidate_star"] == null
            ? null
            : List<dynamic>.from(json["candidate_star"].map((x) => x)),
        changebyname: json["changebyname"],
        conversation:
            json["conversation"] == null ? null : json["conversation"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        cvData: json["cvData"],
        cvParsedAi: json["cvParsedAI"] == null ? null : json["cvParsedAI"],
        cvParsedStatus:
            json["cvParsedStatus"] == null ? null : json["cvParsedStatus"],
        cvTimeStampAi: json["cvTimeStampAI"] == null
            ? null
            : CvTimeStampAi.fromJson(json["cvTimeStampAI"]),
        cvimage:
            json["cvimage"] == null ? null : Cvimage.fromJson(json["cvimage"]),
        dailyMail: json["dailyMail"] == null ? null : json["dailyMail"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        emailDate: json["email_date"] == null
            ? null
            : DateTime.parse(json["email_date"]),
        emailTimestamp:
            json["email_timestamp"] == null ? null : json["email_timestamp"],
        finalEntity: json["finalEntity"] == null
            ? null
            : FinalEntity.fromJson(json["finalEntity"]),
        from: json["from"] == null ? null : json["from"],
        holdReasonData: json["holdReasonData"] == null
            ? null
            : List<HoldReasonData>.from(
                json["holdReasonData"].map((x) => HoldReasonData.fromJson(x))),

        // holdReasonData: json["holdReasonData"] == null
        //     ? null
        //     : List<HoldReasonData>.from(json["holdReasonData"].map((x) => x)),
        imapEmail: json["imap_email"] == null ? null : json["imap_email"],
        index: json["index"],
        interview: json["interview"] == null
            ? null
            : List<InterviewElement>.from(
                json["interview"].map((x) => InterviewElement.fromJson(x))),
        interviewType:
            json["interview_type"] == null ? null : json["interview_type"],
        interviewee: json["interviewee"] == null
            ? null
            : List<dynamic>.from(json["interviewee"].map((x) => x)),
        isArchieved: json["is_archieved"] == null ? null : json["is_archieved"],
        isAttachment:
            json["is_attachment"] == null ? null : json["is_attachment"],
        isAutomaticEmailSend: json["is_automatic_email_send"] == null
            ? null
            : json["is_automatic_email_send"],
        jobProfileId:
            json["job_profile_id"] == null ? null : json["job_profile_id"],
        lastMailDate: json["lastMailDate"] == null
            ? null
            : DateTime.parse(json["lastMailDate"]),
        lastMailDetails: json["lastMailDetails"] == null
            ? null
            : LastMailDetails.fromJson(json["lastMailDetails"]),
        lastTemplateKey:
            json["lastTemplateKey"] == null ? null : json["lastTemplateKey"],
        lastActivityDate: json["last_activity_date"] == null
            ? null
            : DateTime.parse(json["last_activity_date"]),
        manualEmail: json["manualEmail"] == null ? null : json["manualEmail"],
        mobileNo: json["mobile_no"],
        notes: json["notes"] == null
            ? null
            : List<dynamic>.from(json["notes"].map((x) => x)),
        orgName: json["org_name"] == null ? null : json["org_name"],
        readByUser: json["read_by_user"] == null ? null : json["read_by_user"],
        readEmailTime: json["read_email_time"] == null
            ? null
            : DateTime.parse(json["read_email_time"]),
        referee: json["referee"] == null ? null : json["referee"],
        rejectReasonData: json["rejectReasonData"] == null
            ? null
            : List<RejectReasonData>.from(json["rejectReasonData"]
                .map((x) => RejectReasonData.fromJson(x))),
        reminderCount:
            json["reminder_count"] == null ? null : json["reminder_count"],
        replyReminder:
            json["replyReminder"] == null ? null : json["replyReminder"],
        reviewedParsedCvBy: json["reviewedParsedCvBy"] == null
            ? null
            : List<dynamic>.from(json["reviewedParsedCvBy"].map((x) => x)),
        scheduleDate: json["schedule_date"],
        scheduleFor: json["schedule_for"] == null ? null : json["schedule_for"],
        scheduleTime:
            json["schedule_time"] == null ? null : json["schedule_time"],
        sendTemplateCount: json["send_template_count"] == null
            ? null
            : json["send_template_count"],
        senderMail: json["sender_mail"] == null ? null : json["sender_mail"],
        sequence: json["sequence"] == null ? null : json["sequence"],
        skills: json["skills"] == null
            ? null
            : List<dynamic>.from(json["skills"].map((x) => x)),
        socketMessage:
            json["socketMessage"] == null ? null : json["socketMessage"],
        subject: json["subject"] == null ? null : json["subject"],
        tagId: json["tag_id"] == null ? null : json["tag_id"],
        templateId: json["template_id"] == null
            ? null
            : List<dynamic>.from(json["template_id"].map((x) => x)),
        to: json["to"] == null ? null : json["to"],
        uid: json["uid"] == null ? null : json["uid"],
        unread: json["unread"] == null ? null : json["unread"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        updatedTime: json["updatedTime"] == null
            ? null
            : DateTime.parse(json["updatedTime"]),
        datumUpdatedTime: json["updated_time"] == null
            ? null
            : DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "__v": v == null ? null : v,
        "_id": id == null ? null : id,
        "automationMail":
            automationMail == null ? null : automationMail.toJson(),
        "automationProcess":
            automationProcess == null ? null : automationProcess,
        "callingDetails": callingDetails == null
            ? null
            : List<dynamic>.from(callingDetails.map((x) => x)),
        "candidate": candidate == null ? null : candidate,
        "candidateScore": candidateScore == null ? null : candidateScore,
        "candidateSubTagsMovement": candidateSubTagsMovement == null
            ? null
            : candidateSubTagsMovement.toJson(),
        "candidate_id": candidateId == null ? null : candidateId,
        "candidate_star": candidateStar == null
            ? null
            : List<dynamic>.from(candidateStar.map((x) => x)),
        "changebyname": changebyname,
        "conversation": conversation == null ? null : conversation,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "cvData": cvData,
        "cvParsedAI": cvParsedAi == null ? null : cvParsedAi,
        "cvParsedStatus": cvParsedStatus == null ? null : cvParsedStatus,
        "cvTimeStampAI": cvTimeStampAi == null ? null : cvTimeStampAi.toJson(),
        "cvimage": cvimage == null ? null : cvimage.toJson(),
        "dailyMail": dailyMail == null ? null : dailyMail,
        "date": date == null ? null : date.toIso8601String(),
        "email_date": emailDate == null ? null : emailDate.toIso8601String(),
        "email_timestamp": emailTimestamp == null ? null : emailTimestamp,
        "finalEntity": finalEntity == null ? null : finalEntity.toJson(),
        "from": from == null ? null : from,
        "holdReasonData": holdReasonData == null
            ? null
            : List<dynamic>.from(holdReasonData.map((x) => x.toJson())),
        "imap_email": imapEmail == null ? null : imapEmail,
        "index": index,
        "interview": interview == null
            ? null
            : List<dynamic>.from(interview.map((x) => x.toJson())),
        "interview_type": interviewType == null ? null : interviewType,
        "interviewee": interviewee == null
            ? null
            : List<dynamic>.from(interviewee.map((x) => x)),
        "is_archieved": isArchieved == null ? null : isArchieved,
        "is_attachment": isAttachment == null ? null : isAttachment,
        "is_automatic_email_send":
            isAutomaticEmailSend == null ? null : isAutomaticEmailSend,
        "job_profile_id": jobProfileId == null ? null : jobProfileId,
        "lastMailDate":
            lastMailDate == null ? null : lastMailDate.toIso8601String(),
        "lastMailDetails":
            lastMailDetails == null ? null : lastMailDetails.toJson(),
        "lastTemplateKey": lastTemplateKey == null ? null : lastTemplateKey,
        "last_activity_date": lastActivityDate == null
            ? null
            : lastActivityDate.toIso8601String(),
        "manualEmail": manualEmail == null ? null : manualEmail,
        "mobile_no": mobileNo,
        "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x)),
        "org_name": orgName == null ? null : orgName,
        "read_by_user": readByUser == null ? null : readByUser,
        "read_email_time":
            readEmailTime == null ? null : readEmailTime.toIso8601String(),
        "referee": referee == null ? null : referee,
        "rejectReasonData": rejectReasonData == null
            ? null
            : List<dynamic>.from(rejectReasonData.map((x) => x.toJson())),
        "reminder_count": reminderCount == null ? null : reminderCount,
        "replyReminder": replyReminder == null ? null : replyReminder,
        "reviewedParsedCvBy": reviewedParsedCvBy == null
            ? null
            : List<dynamic>.from(reviewedParsedCvBy.map((x) => x)),
        "schedule_date": scheduleDate,
        "schedule_for": scheduleFor == null ? null : scheduleFor,
        "schedule_time": scheduleTime == null ? null : scheduleTime,
        "send_template_count":
            sendTemplateCount == null ? null : sendTemplateCount,
        "sender_mail": senderMail == null ? null : senderMail,
        "sequence": sequence == null ? null : sequence,
        "skills":
            skills == null ? null : List<dynamic>.from(skills.map((x) => x)),
        "socketMessage": socketMessage == null ? null : socketMessage,
        "subject": subject == null ? null : subject,
        "tag_id": tagId == null ? null : tagId,
        "template_id": templateId == null
            ? null
            : List<dynamic>.from(templateId.map((x) => x)),
        "to": to == null ? null : to,
        "uid": uid == null ? null : uid,
        "unread": unread == null ? null : unread,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "updatedTime":
            updatedTime == null ? null : updatedTime.toIso8601String(),
        "updated_time": datumUpdatedTime == null
            ? null
            : datumUpdatedTime.toIso8601String(),
      };
}

class AutomationMail {
  AutomationMail({
    this.message,
    this.subject,
  });

  String message;
  String subject;

  factory AutomationMail.fromRawJson(String str) =>
      AutomationMail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AutomationMail.fromJson(Map<String, dynamic> json) => AutomationMail(
        message: json["message"] == null ? null : json["message"],
        subject: json["subject"] == null ? null : json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "subject": subject == null ? null : subject,
      };
}

class CandidateSubTagsMovement {
  CandidateSubTagsMovement({
    this.interview,
  });

  List<Interview> interview;

  factory CandidateSubTagsMovement.fromRawJson(String str) =>
      CandidateSubTagsMovement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CandidateSubTagsMovement.fromJson(Map<String, dynamic> json) =>
      CandidateSubTagsMovement(
          interview: json["Interview"] != null
              ? List<Interview>.from(
                  json["Interview"].map((x) => Interview.fromJson(x)))
              : json["Hired"] != null
                  ? List<Interview>.from(
                      json["Hired"].map((x) => Interview.fromJson(x)))
                  : null
          // ? json["Hired"]==null?null:
          // : List<Interview>.from(
          //     json["Interview"].map((x) => Interview.fromJson(x))),
          );

  Map<String, dynamic> toJson() => {
        "Interview": interview == null
            ? null
            : List<dynamic>.from(interview.map((x) => x.toJson())),
      };
}

class Interview {
  Interview({
    this.tagId,
    this.tagName,
    this.time,
    this.user,
  });

  String tagId;
  String tagName;
  DateTime time;
  String user;

  factory Interview.fromRawJson(String str) =>
      Interview.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Interview.fromJson(Map<String, dynamic> json) => Interview(
        tagId: json["tagId"] == null ? null : json["tagId"],
        tagName: json["tagName"] == null ? null : json["tagName"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        user: json["user"] == null ? null : json["user"],
      );

  Map<String, dynamic> toJson() => {
        "tagId": tagId == null ? null : tagId,
        "tagName": tagName == null ? null : tagName,
        "time": time == null ? null : time.toIso8601String(),
        "user": user == null ? null : user,
      };
}

class CvTimeStampAi {
  CvTimeStampAi({
    this.days,
    this.priority,
    this.serverCurrentTime,
  });

  double days;
  int priority;
  double serverCurrentTime;

  factory CvTimeStampAi.fromRawJson(String str) =>
      CvTimeStampAi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CvTimeStampAi.fromJson(Map<String, dynamic> json) => CvTimeStampAi(
        days: json["days"] == null ? null : json["days"].toDouble(),
        priority: json["priority"] == null ? null : json["priority"],
        serverCurrentTime: json["server_current_time"] == null
            ? null
            : json["server_current_time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "days": days == null ? null : days,
        "priority": priority == null ? null : priority,
        "server_current_time":
            serverCurrentTime == null ? null : serverCurrentTime,
      };
}

class Cvimage {
  Cvimage({this.images, this.timeTaken, this.picture});

  List<String> images;
  double timeTaken;
  String picture;

  factory Cvimage.fromRawJson(String str) => Cvimage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cvimage.fromJson(Map<String, dynamic> json) => Cvimage(
      images: json["images"] == null
          ? null
          : List<String>.from(json["images"].map((x) => x)),
      timeTaken:
          json["time_taken"] == null ? null : json["time_taken"].toDouble(),
      picture: json["picture"] == null ? null : json["picture"].toString());

  Map<String, dynamic> toJson() => {
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "time_taken": timeTaken == null ? null : timeTaken,
        "picture": picture == null ? null : picture
      };
}

class FinalEntity {
  FinalEntity({
    this.gender,
  });

  List<dynamic> gender;

  factory FinalEntity.fromRawJson(String str) =>
      FinalEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FinalEntity.fromJson(Map<String, dynamic> json) => FinalEntity(
        gender: json["gender"] == null
            ? null
            : List<dynamic>.from(json["gender"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gender":
            gender == null ? null : List<dynamic>.from(gender.map((x) => x)),
      };
}

class InterviewElement {
  InterviewElement({
    this.details,
    this.jobId,
  });

  List<Detail> details;
  String jobId;

  factory InterviewElement.fromRawJson(String str) =>
      InterviewElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InterviewElement.fromJson(Map<String, dynamic> json) =>
      InterviewElement(
        details: json["details"] == null
            ? null
            : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
        jobId: json["job_id"] == null ? null : json["job_id"],
      );

  Map<String, dynamic> toJson() => {
        "details": details == null
            ? null
            : List<dynamic>.from(details.map((x) => x.toJson())),
        "job_id": jobId == null ? null : jobId,
      };
}

class Detail {
  Detail({
    this.roundName,
    this.scheduleDate,
    this.scheduleFor,
    this.scheduleTime,
    this.user,
  });

  String roundName;
  DateTime scheduleDate;
  String scheduleFor;
  String scheduleTime;
  String user;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        roundName: json["round_name"] == null ? null : json["round_name"],
        scheduleDate: json["schedule_date"] == null
            ? null
            : DateTime.parse(json["schedule_date"]),
        scheduleFor: json["schedule_for"] == null ? null : json["schedule_for"],
        scheduleTime:
            json["schedule_time"] == null ? null : json["schedule_time"],
        user: json["user"] == null ? null : json["user"],
      );

  Map<String, dynamic> toJson() => {
        "round_name": roundName == null ? null : roundName,
        "schedule_date":
            scheduleDate == null ? null : scheduleDate.toIso8601String(),
        "schedule_for": scheduleFor == null ? null : scheduleFor,
        "schedule_time": scheduleTime == null ? null : scheduleTime,
        "user": user == null ? null : user,
      };
}

class LastMailDetails {
  LastMailDetails({
    this.interviewMail,
    this.message,
    this.subject,
  });

  bool interviewMail;
  String message;
  String subject;

  factory LastMailDetails.fromRawJson(String str) =>
      LastMailDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LastMailDetails.fromJson(Map<String, dynamic> json) =>
      LastMailDetails(
        interviewMail:
            json["interviewMail"] == null ? null : json["interviewMail"],
        message: json["message"] == null ? null : json["message"],
        subject: json["subject"] == null ? null : json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "interviewMail": interviewMail == null ? null : interviewMail,
        "message": message == null ? null : message,
        "subject": subject == null ? null : subject,
      };
}

class HoldReasonData {
  HoldReasonData({
    this.holdReason,
    this.imageUrl,
    this.name,
  });

  String holdReason;
  String imageUrl;
  String name;

  factory HoldReasonData.fromRawJson(String str) =>
      HoldReasonData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HoldReasonData.fromJson(Map<String, dynamic> json) => HoldReasonData(
        holdReason: json["holdReason"] == null ? null : json["holdReason"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "holdReason": holdReason == null ? null : holdReason,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "name": name == null ? null : name,
      };
}

class RejectReasonData {
  RejectReasonData({
    this.imageUrl,
    this.name,
    this.rejectReason,
  });

  String imageUrl;
  String name;
  String rejectReason;

  factory RejectReasonData.fromRawJson(String str) =>
      RejectReasonData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RejectReasonData.fromJson(Map<String, dynamic> json) =>
      RejectReasonData(
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        name: json["name"] == null ? null : json["name"],
        rejectReason:
            json["rejectReason"] == null ? null : json["rejectReason"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl == null ? null : imageUrl,
        "name": name == null ? null : name,
        "rejectReason": rejectReason == null ? null : rejectReason,
      };
}
