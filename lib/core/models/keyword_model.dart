class KeywordModel {
  final String? name;
  final int? id;

  KeywordModel({required this.name, required this.id});

  factory KeywordModel.fromJson(Map<String, dynamic> json) {
    return KeywordModel(
      name: json['name'],
      id: json['id'],
    );
  }
}
