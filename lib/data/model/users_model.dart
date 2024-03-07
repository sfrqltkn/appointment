class Users {
  String userId;
  String firstname;
  String lastname;
  String phoneNumber;
  String email;

  Users({
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.phoneNumber,
    required this.email,
  });

  factory Users.fromJson(Map<dynamic, dynamic> json , String key) {
    return Users(
      userId: key,
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }
}
