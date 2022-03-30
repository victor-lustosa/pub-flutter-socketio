class Data {
  late String type;
  Data.withoutRequired(this.type);
  Data({required this.type});

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      type: map['type'] as String,
    );
  }
}