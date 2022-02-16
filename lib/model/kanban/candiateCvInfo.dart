import 'dart:convert';

class CandidateCvInfoModel {
  CandidateCvInfoModel({
    this.cvParsedInfo,
  });

  CvParsedInfo cvParsedInfo;

  factory CandidateCvInfoModel.fromRawJson(String str) =>
      CandidateCvInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CandidateCvInfoModel.fromJson(Map<String, dynamic> json) =>
      CandidateCvInfoModel(
        cvParsedInfo: !json["cvParsedInfo"].containsKey("ai_version")
            ? null
            : CvParsedInfo.fromJson(json["cvParsedInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "cvParsedInfo": cvParsedInfo == null ? null : cvParsedInfo.toJson(),
      };
}

class CvParsedInfo {
  CvParsedInfo({
    this.aiVersion,
    this.aiVersionProcessed,
    this.finalEntity,
    this.newCompressedStructuredContent,
    this.parsingType,
    this.candidateScore,
    this.candidateScoreDebug,
    this.qaShortAnswers,
    this.qaType,
    this.skillExtracted,
    this.timeTaken,
  });

  String aiVersion;
  String aiVersionProcessed;
  FinalEntity finalEntity;
  double candidateScore;
  List<String> candidateScoreDebug;
  NewCompressedStructuredContent newCompressedStructuredContent;
  String parsingType;
  QaShortAnswers qaShortAnswers;
  String qaType;
  SkillExtracted skillExtracted;
  double timeTaken;

  factory CvParsedInfo.fromRawJson(String str) =>
      CvParsedInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CvParsedInfo.fromJson(Map<String, dynamic> json) => CvParsedInfo(
        aiVersion: json["ai_version"] == null ? null : json["ai_version"],
        aiVersionProcessed: json["ai_version_processed"] == null
            ? null
            : json["ai_version_processed"],
        finalEntity: json["finalEntity"] == null
            ? null
            : FinalEntity.fromJson(json["finalEntity"]),
        candidateScore: json["candidate_score"].toDouble(),
        candidateScoreDebug:
            List<String>.from(json["candidate_score_debug"].map((x) => x)),
        newCompressedStructuredContent:
            json["newCompressedStructuredContent"] == null
                ? null
                : NewCompressedStructuredContent.fromJson(
                    json["newCompressedStructuredContent"]),
        parsingType: json["parsing_type"] == null ? null : json["parsing_type"],
        qaShortAnswers: json["qa_short_answers"] == null
            ? null
            : QaShortAnswers.fromJson(json["qa_short_answers"]),
        qaType: json["qa_type"] == null ? null : json["qa_type"],
        skillExtracted: json["skillExtracted"] == null
            ? null
            : SkillExtracted.fromJson(json["skillExtracted"]),
        timeTaken:
            json["timeTaken"] == null ? null : json["timeTaken"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "ai_version": aiVersion == null ? null : aiVersion,
        "ai_version_processed":
            aiVersionProcessed == null ? null : aiVersionProcessed,
        "finalEntity": finalEntity == null ? null : finalEntity.toJson(),
        "newCompressedStructuredContent": newCompressedStructuredContent == null
            ? null
            : newCompressedStructuredContent.toJson(),
        "parsing_type": parsingType == null ? null : parsingType,
        "qa_short_answers":
            qaShortAnswers == null ? null : qaShortAnswers.toJson(),
        "qa_type": qaType == null ? null : qaType,
        "skillExtracted":
            skillExtracted == null ? null : skillExtracted.toJson(),
        "timeTaken": timeTaken == null ? null : timeTaken,
      };
}

class FinalEntity {
  FinalEntity({
    this.dob,
    this.designation,
    this.educationDegree,
    this.email,
    this.gpe,
    this.person,
    this.phone,
    this.additionalPerson,
    this.additionalPhone,
    this.education,
    this.gender,
    this.wrkExp,
  });

  Dob dob;
  Designation designation;
  Dob educationDegree;
  Dob email;
  Dob gpe;
  Dob person;
  Dob phone;
  List<String> additionalPerson;
  List<String> additionalPhone;
  List<List<Education>> education;
  List<dynamic> gender;
  List<List<Designation>> wrkExp;

  factory FinalEntity.fromRawJson(String str) =>
      FinalEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FinalEntity.fromJson(Map<String, dynamic> json) => FinalEntity(
        dob: json["DOB"] == null ? null : Dob.fromJson(json["DOB"]),
        designation: json["Designation"] == null
            ? null
            : Designation.fromJson(json["Designation"]),
        educationDegree: json["EducationDegree"] == null
            ? null
            : Dob.fromJson(json["EducationDegree"]),
        email: json["Email"] == null ? null : Dob.fromJson(json["Email"]),
        gpe: json["GPE"] == null ? null : Dob.fromJson(json["GPE"]),
        person: json["PERSON"] == null ? null : Dob.fromJson(json["PERSON"]),
        phone: json["Phone"] == null ? null : Dob.fromJson(json["Phone"]),
        additionalPerson: json["additional-PERSON"] == null
            ? null
            : List<String>.from(json["additional-PERSON"].map((x) => x)),
        additionalPhone: json["additional-Phone"] == null
            ? null
            : List<String>.from(json["additional-Phone"].map((x) => x)),
        education: json["education"] == null
            ? null
            : List<List<Education>>.from(json["education"].map((x) =>
                List<Education>.from(x.map((x) => Education.fromJson(x))))),
        gender: json["gender"] == null
            ? null
            : List<dynamic>.from(json["gender"].map((x) => x)),
        wrkExp: json["wrkExp"] == null
            ? null
            : List<List<Designation>>.from(json["wrkExp"].map((x) =>
                List<Designation>.from(x.map((x) => Designation.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "DOB": dob == null ? null : dob.toJson(),
        "Designation": designation == null ? null : designation.toJson(),
        "EducationDegree":
            educationDegree == null ? null : educationDegree.toJson(),
        "Email": email == null ? null : email.toJson(),
        "GPE": gpe == null ? null : gpe.toJson(),
        "PERSON": person == null ? null : person.toJson(),
        "Phone": phone == null ? null : phone.toJson(),
        "additional-PERSON": additionalPerson == null
            ? null
            : List<dynamic>.from(additionalPerson.map((x) => x)),
        "additional-Phone": additionalPhone == null
            ? null
            : List<dynamic>.from(additionalPhone.map((x) => x)),
        "education": education == null
            ? null
            : List<dynamic>.from(education
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "gender":
            gender == null ? null : List<dynamic>.from(gender.map((x) => x)),
        "wrkExp": wrkExp == null
            ? null
            : List<dynamic>.from(wrkExp
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Designation {
  Designation({
    this.afterQa,
    this.confidance,
    this.endPos,
    this.label,
    this.startPos,
    this.text,
    this.designation,
    this.org,
  });

  int afterQa;
  double confidance;
  int endPos;
  String label;
  int startPos;
  String text;
  String designation;
  String org;

  factory Designation.fromRawJson(String str) =>
      Designation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        afterQa: json["after_qa"] == null ? null : json["after_qa"],
        confidance:
            json["confidance"] == null ? null : json["confidance"].toDouble(),
        endPos: json["end_pos"] == null ? null : json["end_pos"],
        label: json["label"] == null ? null : json["label"],
        startPos: json["start_pos"] == null ? null : json["start_pos"],
        text: json["text"] == null ? null : json["text"],
        designation: json["Designation"] == null ? null : json["Designation"],
        org: json["org"] == null ? null : json["org"],
      );

  Map<String, dynamic> toJson() => {
        "after_qa": afterQa == null ? null : afterQa,
        "confidance": confidance == null ? null : confidance,
        "end_pos": endPos == null ? null : endPos,
        "label": label == null ? null : label,
        "start_pos": startPos == null ? null : startPos,
        "text": text == null ? null : text,
        "Designation": designation == null ? null : designation,
        "org": org == null ? null : org,
      };
}

class Dob {
  Dob({
    this.contentIdx,
    this.obj,
    this.pageno,
  });

  List<int> contentIdx;
  String obj;
  int pageno;

  factory Dob.fromRawJson(String str) => Dob.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        contentIdx: json["contentIdx"] == null
            ? null
            : List<int>.from(json["contentIdx"].map((x) => x)),
        obj: json["obj"] == null ? null : json["obj"],
        pageno: json["pageno"] == null ? null : json["pageno"],
      );

  Map<String, dynamic> toJson() => {
        "contentIdx": contentIdx == null
            ? null
            : List<dynamic>.from(contentIdx.map((x) => x)),
        "obj": obj == null ? null : obj,
        "pageno": pageno == null ? null : pageno,
      };
}

class Education {
  Education({
    this.educationDegree,
    this.contentIdx,
    this.org,
    this.pageno,
  });

  String educationDegree;
  List<int> contentIdx;
  String org;
  int pageno;

  factory Education.fromRawJson(String str) =>
      Education.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        educationDegree:
            json["EducationDegree"] == null ? null : json["EducationDegree"],
        contentIdx: json["contentIdx"] == null
            ? null
            : List<int>.from(json["contentIdx"].map((x) => x)),
        org: json["org"] == null ? null : json["org"],
        pageno: json["pageno"] == null ? null : json["pageno"],
      );

  Map<String, dynamic> toJson() => {
        "EducationDegree": educationDegree == null ? null : educationDegree,
        "contentIdx": contentIdx == null
            ? null
            : List<dynamic>.from(contentIdx.map((x) => x)),
        "org": org == null ? null : org,
        "pageno": pageno == null ? null : pageno,
      };
}

class NewCompressedStructuredContent {
  NewCompressedStructuredContent({
    this.the1,
  });

  List<The1> the1;

  factory NewCompressedStructuredContent.fromRawJson(String str) =>
      NewCompressedStructuredContent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewCompressedStructuredContent.fromJson(Map<String, dynamic> json) =>
      NewCompressedStructuredContent(
        the1: json["1"] == null
            ? null
            : List<The1>.from(json["1"].map((x) => The1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "1": the1 == null
            ? null
            : List<dynamic>.from(the1.map((x) => x.toJson())),
      };
}

class The1 {
  The1({
    this.line,
    this.classify,
    this.classifyreason,
    this.contentIdx,
    this.classifyNn,
  });

  String line;
  String classify;
  String classifyreason;
  List<int> contentIdx;
  List<dynamic> classifyNn;

  factory The1.fromRawJson(String str) => The1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        line: json["line"] == null ? null : json["line"],
        classify: json["classify"] == null ? null : json["classify"],
        classifyreason:
            json["classifyreason"] == null ? null : json["classifyreason"],
        contentIdx: json["contentIdx"] == null
            ? null
            : List<int>.from(json["contentIdx"].map((x) => x)),
        classifyNn: json["classifyNN"] == null
            ? null
            : List<dynamic>.from(json["classifyNN"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "line": line == null ? null : line,
        "classify": classify == null ? null : classify,
        "classifyreason": classifyreason == null ? null : classifyreason,
        "contentIdx": contentIdx == null
            ? null
            : List<dynamic>.from(contentIdx.map((x) => x)),
        "classifyNN": classifyNn == null
            ? null
            : List<dynamic>.from(classifyNn.map((x) => x)),
      };
}

class QaShortAnswers {
  QaShortAnswers({
    this.personalName,
  });

  String personalName;

  factory QaShortAnswers.fromRawJson(String str) =>
      QaShortAnswers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QaShortAnswers.fromJson(Map<String, dynamic> json) => QaShortAnswers(
        personalName:
            json["personal_name"] == null ? null : json["personal_name"],
      );

  Map<String, dynamic> toJson() => {
        "personal_name": personalName == null ? null : personalName,
      };
}

class SkillExtracted {
  SkillExtracted();

  factory SkillExtracted.fromRawJson(String str) =>
      SkillExtracted.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SkillExtracted.fromJson(Map<String, dynamic> json) =>
      SkillExtracted();

  Map<String, dynamic> toJson() => {};
}
