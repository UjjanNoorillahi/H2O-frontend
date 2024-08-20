// event_model.dart
class EventModel {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final DateTime date;
  final String time;
  final String venue;
  final int totalSeats;
  final int availableSeats;
  final int ticketPrice;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.date,
    required this.time,
    required this.venue,
    required this.totalSeats,
    required this.availableSeats,
    required this.ticketPrice,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images']),
      date: DateTime.parse(json['date']),
      time: json['time'],
      venue: json['venue'],
      totalSeats: json['totalSeats'],
      availableSeats: json['availableSeats'],
      ticketPrice: json['ticketPrice'],
      createdBy: json['createdBy'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
