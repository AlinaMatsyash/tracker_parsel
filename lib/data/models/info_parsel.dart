import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Data {
  Accepted accepted;

  // Rejected rejected;
  Data({required this.accepted});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accepted: Accepted.fromJson(json["accepted"]),
      // rejected: Rejected.fromJson(json["rejected"]),
    );
  }
}

class Accepted {
  String number;
  Track track;

  Accepted({required this.track, required this.number});

  factory Accepted.fromJson(Map<String, dynamic> json) {
    return Accepted(
        number: json['number'], track: Track.fromJson(json['track']));
  }
}

class Track {
  List<FirstCarrierEvent> firstCarrierEvent; //z1
  //SecondCarrierEvent secondCarrierEvent; //z2

  Track(
      {
      // required this.secondCarrierEvent,
      required this.firstCarrierEvent});

  factory Track.fromJson(Map<String, dynamic> json) {
    final firstCarrierEventData = json['z1'];
    final firstCarrierEvent = firstCarrierEventData != null
        ? firstCarrierEventData
            .map((firstCarrierEventData) =>
                FirstCarrierEvent.fromJson(firstCarrierEventData))
            .toList()
        : <FirstCarrierEvent>[];
    return Track(
      firstCarrierEvent: firstCarrierEvent, //z1
      // secondCarrierEvent:
      // SecondCarrierEvent.fromJson(json['z2'])
    ); //z2
  }
}

// "a": "2022-03-15 12:18",
// "c": "",
// "d": "",
// "z": "Parcel has arrived at transit location"
class FirstCarrierEvent {
  DateTime eventTime; //a
  String eventLocation; //c
  String eventLocationExtension; //d
  String eventContent; //z
  FirstCarrierEvent(
      {required this.eventTime,
      required this.eventLocation,
      required this.eventLocationExtension,
      required this.eventContent});

  factory FirstCarrierEvent.fromJson(Map<String, dynamic> json) {
    final eventTime = json['a'];
    final eventLocation = json['c']; //c
    final eventLocationExtension = json['d']; //d
    final eventContent = json['z'];
    return FirstCarrierEvent(
        eventTime: eventTime,
        eventLocation: eventLocation,
        eventLocationExtension: eventLocationExtension,
        eventContent: eventContent);
  }
}
