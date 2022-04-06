import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? text;
  DateTime? date;
  MessageModel({
    this.text,
    this.date,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['text'] = text;
    data['date'] = date;
    return data;
  }
  MessageModel.fromJson(Map<String, dynamic> json) {
    text = json['text'] ?? '';
    if (json['date'] != null) {
      date = (json['date'] as Timestamp).toDate();
    } else {
      date = null;
    }
  }
}
