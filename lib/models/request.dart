// To parse this JSON data, do
//
//     final request = requestFromJson(jsonString);

import 'dart:convert';

Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
  Request({
    required this.id,
    required this.flatRequestStatus,
    // required this.civility,
    // required this.lastname,
    // required this.firstname,
    // required this.birthdate,
    required this.email,
    // required this.mobilephone,
    // required this.birthplace,
    // required this.nationality,
    // required this.address,
    // required this.postalcode,
    // required this.city,
    // required this.accomodationstatus,
    // required this.requesttype,
    // required this.parent,
    // required this.educationalsituation,
    // required this.hascaf,
    // required this.hasmsa,
    // required this.requestalreadyexists,
    // required this.contactcivility,
    // required this.contactlastname,
    // required this.contactfirstname,
    // required this.contactphonenumber,
    // required this.contactrelationship,
    // required this.activity,
    // required this.jobseeker,
    // required this.othersituation,
    // required this.desiredentrydate,
    // required this.desiredreleaseDate,
    // required this.flatrequestType,
    // required this.securitydeposittype,
    // required this.requestreason,
    // required this.howknowcenter,
    // required this.personnalauthorization,
    // required this.identitydocument,
    // required this.activityproof,
    // required this.activityressourceproof,
    // required this.setpayslip,
    // required this.taxnotice,
    // required this.educationcertificate,
    // required this.scholarshipnotification,
    // required this.cpamcertificate,
  });

  int id;
  String flatRequestStatus;
  // String civility;
  // String lastname;
  // String firstname;
  // DateTime birthdate;
  String email;
  // String mobilephone;
  // String birthplace;
  // String nationality;
  // String address;
  // int postalcode;
  // String city;
  // String accomodationstatus;
  // String requesttype;
  // bool parent;
  // bool educationalsituation;
  // bool hascaf;
  // bool hasmsa;
  // bool requestalreadyexists;
  // String contactcivility;
  // String contactlastname;
  // String contactfirstname;
  // String contactphonenumber;
  // String contactrelationship;
  // String activity;
  // bool jobseeker;
  // String othersituation;
  // DateTime desiredentrydate;
  // DateTime desiredreleaseDate;
  // String flatrequestType;
  // String securitydeposittype;
  // String requestreason;
  // String howknowcenter;
  // bool personnalauthorization;
  // String identitydocument;
  // String activityproof;
  // String activityressourceproof;
  // String setpayslip;
  // String taxnotice;
  // String educationcertificate;
  // String scholarshipnotification;
  // String cpamcertificate;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    id: json["id"],
    flatRequestStatus: json["flatRequest_status"],
    // civility: json["civility"],
    // lastname: json["lastname"],
    // firstname: json["firstname"],
    // birthdate: DateTime.parse(json["birthdate"]),
    email: json["email"],
    // mobilephone: json["mobilephone"],
    // birthplace: json["birthplace"],
    // nationality: json["nationality"],
    // address: json["address"],
    // postalcode: json["postalcode"],
    // city: json["city"],
    // accomodationstatus: json["accomodationstatus"],
    // requesttype: json["requesttype"],
    // parent: json["parent"],
    // educationalsituation: json["educationalsituation"],
    // hascaf: json["hascaf"],
    // hasmsa: json["hasmsa"],
    // requestalreadyexists: json["requestalreadyexists"],
    // contactcivility: json["contactcivility"],
    // contactlastname: json["contactlastname"],
    // contactfirstname: json["contactfirstname"],
    // contactphonenumber: json["contactphonenumber"],
    // contactrelationship: json["contactrelationship"],
    // activity: json["activity"],
    // jobseeker: json["jobseeker"],
    // othersituation: json["othersituation"],
    // desiredentrydate: DateTime.parse(json["desiredentrydate"]),
    // desiredreleaseDate: DateTime.parse(json["desiredreleaseDate"]),
    // flatrequestType: json["flatrequestType"],
    // securitydeposittype: json["securitydeposittype"],
    // requestreason: json["requestreason"],
    // howknowcenter: json["howknowcenter"],
    // personnalauthorization: json["personnalauthorization"],
    // identitydocument: json["identitydocument"],
    // activityproof: json["activityproof"],
    // activityressourceproof: json["activityressourceproof"],
    // setpayslip: json["setpayslip"],
    // taxnotice: json["taxnotice"],
    // educationcertificate: json["educationcertificate"],
    // scholarshipnotification: json["scholarshipnotification"],
    // cpamcertificate: json["cpamcertificate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "flatRequest_status": flatRequestStatus,
    // "civility": civility,
    // "lastname": lastname,
    // "firstname": firstname,
    // "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "email": email,
    // "mobilephone": mobilephone,
    // "birthplace": birthplace,
    // "nationality": nationality,
    // "address": address,
    // "postalcode": postalcode,
    // "city": city,
    // "accomodationstatus": accomodationstatus,
    // "requesttype": requesttype,
    // "parent": parent,
    // "educationalsituation": educationalsituation,
    // "hascaf": hascaf,
    // "hasmsa": hasmsa,
    // "requestalreadyexists": requestalreadyexists,
    // "contactcivility": contactcivility,
    // "contactlastname": contactlastname,
    // "contactfirstname": contactfirstname,
    // "contactphonenumber": contactphonenumber,
    // "contactrelationship": contactrelationship,
    // "activity": activity,
    // "jobseeker": jobseeker,
    // "othersituation": othersituation,
    // "desiredentrydate": "${desiredentrydate.year.toString().padLeft(4, '0')}-${desiredentrydate.month.toString().padLeft(2, '0')}-${desiredentrydate.day.toString().padLeft(2, '0')}",
    // "desiredreleaseDate": "${desiredreleaseDate.year.toString().padLeft(4, '0')}-${desiredreleaseDate.month.toString().padLeft(2, '0')}-${desiredreleaseDate.day.toString().padLeft(2, '0')}",
    // "flatrequestType": flatrequestType,
    // "securitydeposittype": securitydeposittype,
    // "requestreason": requestreason,
    // "howknowcenter": howknowcenter,
    // "personnalauthorization": personnalauthorization,
    // "identitydocument": identitydocument,
    // "activityproof": activityproof,
    // "activityressourceproof": activityressourceproof,
    // "setpayslip": setpayslip,
    // "taxnotice": taxnotice,
    // "educationcertificate": educationcertificate,
    // "scholarshipnotification": scholarshipnotification,
    // "cpamcertificate": cpamcertificate,
  };
}
