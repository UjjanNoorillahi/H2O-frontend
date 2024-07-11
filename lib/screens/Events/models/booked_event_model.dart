class Event {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final DateTime date;
  final String time;
  final String venue;
  final int totalSeats;
  final int availableSeats;
  final double ticketPrice;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  Event({
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
    required this.version,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images']),
      date: DateTime.parse(json['date']),
      time: json['time'],
      venue: json['venue'],
      totalSeats: json['totalSeats'],
      availableSeats: json['availableSeats'],
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
      createdBy: json['createdBy'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'images': images,
      'date': date.toIso8601String(),
      'time': time,
      'venue': venue,
      'totalSeats': totalSeats,
      'availableSeats': availableSeats,
      'ticketPrice': ticketPrice,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}
