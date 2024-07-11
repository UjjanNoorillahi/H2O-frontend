class TicketResponse {
  final String message;
  final Ticket ticket;

  TicketResponse({required this.message, required this.ticket});

  factory TicketResponse.fromJson(Map<String, dynamic> json) {
    return TicketResponse(
      message: json['message'],
      ticket: Ticket.fromJson(json['ticket']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'ticket': ticket.toJson(),
    };
  }
}

class Ticket {
  final String userId;
  final String eventId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  Ticket({
    required this.userId,
    required this.eventId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      userId: json['userId'],
      eventId: json['eventId'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'eventId': eventId,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}
