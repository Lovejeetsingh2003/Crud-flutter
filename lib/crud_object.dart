class CrudObject {
  int? id;
  String? name;
  int? rollNo;
  String? phoneNo;

  CrudObject({
    this.id,
    this.name,
    this.rollNo,
    this.phoneNo,
  });

  factory CrudObject.fromJson(Map<String, dynamic> json) => CrudObject(
        id: json["id"],
        name: json["name"],
        rollNo: json["rollNo"],
        phoneNo: json["phoneNo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rollNo": rollNo,
        "phoneNo": phoneNo,
      };
}
