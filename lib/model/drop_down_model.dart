// To parse this JSON data, do
//
//     final domainDropDown = domainDropDownFromJson(jsonString);

import 'dart:convert';

DomainDropDown domainDropDownFromJson(String str) =>
    DomainDropDown.fromJson(json.decode(str));

String domainDropDownToJson(DomainDropDown data) => json.encode(data.toJson());

class DomainDropDown {
  DomainDropDown({
    this.hrRecruitmentBin,
    this.salesBin,
    this.teachingEducationBin,
    this.accountsBin,
    this.customerServiceBin,
    this.legalBin,
    this.marketingBin,
    this.others,
    this.softwareDevelopmentBin,
  });

  String hrRecruitmentBin;
  String salesBin;
  String teachingEducationBin;
  String accountsBin;
  String customerServiceBin;
  String legalBin;
  String marketingBin;
  String others;
  String softwareDevelopmentBin;

  factory DomainDropDown.fromJson(Map<String, dynamic> json) => DomainDropDown(
        hrRecruitmentBin: json["HR Recruitment.bin"],
        salesBin: json["Sales.bin"],
        teachingEducationBin: json["Teaching Education.bin"],
        accountsBin: json["accounts.bin"],
        customerServiceBin: json["customer service.bin"],
        legalBin: json["legal.bin"],
        marketingBin: json["marketing.bin"],
        others: json["others"],
        softwareDevelopmentBin: json["software development.bin"],
      );

  Map<String, dynamic> toJson() => {
        "HR Recruitment.bin": hrRecruitmentBin,
        "Sales.bin": salesBin,
        "Teaching Education.bin": teachingEducationBin,
        "accounts.bin": accountsBin,
        "customer service.bin": customerServiceBin,
        "legal.bin": legalBin,
        "marketing.bin": marketingBin,
        "others": others,
        "software development.bin": softwareDevelopmentBin,
      };
}
