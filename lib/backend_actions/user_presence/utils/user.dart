class UserModel {
  String? uid;
  String? name;
  bool? presence;
  int? lastSeenInEpoch;

  UserModel({
    required this.uid,
    required this.name,
    required this.presence,
    required this.lastSeenInEpoch,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    presence = json['presence'];
    lastSeenInEpoch = json['last_seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['uid'] = uid;
    data['name'] = name;
    data['presence'] = presence;
    data['last_seen'] = lastSeenInEpoch;

    return data;
  }
}
