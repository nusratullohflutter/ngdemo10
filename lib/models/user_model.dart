class User {
  int? id;
  String? username;

  User({this.id, this.username});

  User.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'];

  Map<String, dynamic> toMap() => {'id': id, 'username': username};
}
