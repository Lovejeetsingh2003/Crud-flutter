class CrudObject {
  String? name;
  int? rollNo;
  String? phoneNo;

  CrudObject({
    this.name,
    this.rollNo,
    this.phoneNo,
  });

  factory CrudObject.fromJson(Map<String, dynamic> json) => CrudObject(
        name: json["name"],
        rollNo: json["roll_no"],
        phoneNo: json["phone_no"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "roll_no": rollNo,
        "phone_no": phoneNo,
      };
}
