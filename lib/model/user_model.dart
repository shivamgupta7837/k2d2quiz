class UserModel {
  String? _name;
  String? _studentId;
  String? _classes;
  String? _age;

  UserModel({
    required String? name,
    required String? studentId,
    required String? classes,
    required String? age,
  }) : _age = age, _classes = classes, _studentId = studentId, _name = name;

  UserModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _studentId = json['studentId'];
    _classes = json['classes'];
    _age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = _name;
    data["studentId"] = _studentId;
    data["classes"] = _classes;
    data["age"] = _age;
    return data;
  }
}
