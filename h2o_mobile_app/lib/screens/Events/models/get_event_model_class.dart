class Event {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final String date;
  final String time;
  final String venue;
  final int totalSeats;
  final int availableSeats;
  final int ticketPrice;
  final String createdBy;
  final String createdAt;
  final String updatedAt;
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
      date: json['date'],
      time: json['time'],
      venue: json['venue'],
      totalSeats: json['totalSeats'],
      availableSeats: json['availableSeats'],
      ticketPrice: json['ticketPrice'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      version: json['__v'],
    );
  }
}
