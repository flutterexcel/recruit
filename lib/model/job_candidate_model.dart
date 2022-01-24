// To parse this JSON data, do
//
//     final jobCandidates = jobCandidatesFromJson(jsonString);

import 'dart:convert';

ApplicationStatusModel jobCandidatesFromJson(String str) => ApplicationStatusModel.fromJson(json.decode(str));

String jobCandidatesToJson(ApplicationStatusModel data) => json.encode(data.toJson());

class ApplicationStatusModel {
    ApplicationStatusModel({
        this.status,
        this.data,
    });

    int status;
    List<Datum> data;

    factory ApplicationStatusModel.fromJson(Map<String, dynamic> json) => ApplicationStatusModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.candidates,
        this.jobOpenings,
        this.jobApplicants,
        this.jobApplicantsTags,
    });

    int candidates;
    int jobOpenings;
    int jobApplicants;
    List<JobApplicantsTag> jobApplicantsTags;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        candidates: json["Candidates"] == null ? null : json["Candidates"],
        jobOpenings: json["jobOpenings"] == null ? null : json["jobOpenings"],
        jobApplicants: json["jobApplicants"] == null ? null : json["jobApplicants"],
        jobApplicantsTags: json["jobApplicantsTags"] == null ? null : List<JobApplicantsTag>.from(json["jobApplicantsTags"].map((x) => JobApplicantsTag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Candidates": candidates == null ? null : candidates,
        "jobOpenings": jobOpenings == null ? null : jobOpenings,
        "jobApplicants": jobApplicants == null ? null : jobApplicants,
        "jobApplicantsTags": jobApplicantsTags == null ? null : List<dynamic>.from(jobApplicantsTags.map((x) => x.toJson())),
    };
}

class JobApplicantsTag {
    JobApplicantsTag({
        this.jobApplicantsTagNew,
        this.jobApplicantsTagDefault,
        this.shortlist,
        this.interview,
        this.hired,
        this.hold,
        this.reject,
        this.firstRound,
        this.secondRound,
        this.thirdRound,
        this.offerSent,
        this.accepted,
        this.joined,
        this.the55,
        this.g,
        this.the1,
        this.the2,
    });

    int jobApplicantsTagNew;
    bool jobApplicantsTagDefault;
    int shortlist;
    int interview;
    int hired;
    int hold;
    int reject;
    int firstRound;
    int secondRound;
    int thirdRound;
    int offerSent;
    int accepted;
    int joined;
    int the55;
    int g;
    int the1;
    int the2;

    factory JobApplicantsTag.fromJson(Map<String, dynamic> json) => JobApplicantsTag(
        jobApplicantsTagNew: json["New"] == null ? null : json["New"],
        jobApplicantsTagDefault: json["default"],
        shortlist: json["Shortlist"] == null ? null : json["Shortlist"],
        interview: json["Interview"] == null ? null : json["Interview"],
        hired: json["Hired"] == null ? null : json["Hired"],
        hold: json["Hold"] == null ? null : json["Hold"],
        reject: json["Reject"] == null ? null : json["Reject"],
        firstRound: json["First Round"] == null ? null : json["First Round"],
        secondRound: json["Second Round"] == null ? null : json["Second Round"],
        thirdRound: json["Third Round"] == null ? null : json["Third Round"],
        offerSent: json["Offer Sent"] == null ? null : json["Offer Sent"],
        accepted: json["Accepted"] == null ? null : json["Accepted"],
        joined: json["Joined"] == null ? null : json["Joined"],
        the55: json["55"] == null ? null : json["55"],
        g: json["g"] == null ? null : json["g"],
        the1: json["1"] == null ? null : json["1"],
        the2: json["2"] == null ? null : json["2"],
    );

    Map<String, dynamic> toJson() => {
        "New": jobApplicantsTagNew == null ? null : jobApplicantsTagNew,
        "default": jobApplicantsTagDefault,
        "Shortlist": shortlist == null ? null : shortlist,
        "Interview": interview == null ? null : interview,
        "Hired": hired == null ? null : hired,
        "Hold": hold == null ? null : hold,
        "Reject": reject == null ? null : reject,
        "First Round": firstRound == null ? null : firstRound,
        "Second Round": secondRound == null ? null : secondRound,
        "Third Round": thirdRound == null ? null : thirdRound,
        "Offer Sent": offerSent == null ? null : offerSent,
        "Accepted": accepted == null ? null : accepted,
        "Joined": joined == null ? null : joined,
        "55": the55 == null ? null : the55,
        "g": g == null ? null : g,
        "1": the1 == null ? null : the1,
        "2": the2 == null ? null : the2,
    };
}
