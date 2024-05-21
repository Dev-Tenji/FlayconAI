class HuggerModel {
  int? id;
  String? apiKey;

  HuggerModel({
    required this.id,
    required this.apiKey,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "apikey": apiKey,
    };
  }

  HuggerModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    apiKey = map["apikey"];
  }
}
