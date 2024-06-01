class MyAppointmentModel {
  String userId;
  String date;
  String day;
  String operation;
  String person;
  String price;
  String time;

  MyAppointmentModel(
      {required this.userId,
      required this.date,
      required this.day,
      required this.operation,
      required this.person,
      required this.price,
      required this.time});

  factory MyAppointmentModel.fromJson(Map<dynamic, dynamic> json, String key) {
    return MyAppointmentModel(
      userId: key,
      date: json['date'],
      day: json['day'],
      operation: json['operation'],
      person: json['person'],
      price: json['price'],
      time: json['time'],
    );
  }
}
