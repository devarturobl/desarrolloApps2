class Ticket {
  int? id;
  String? userapp;
  String? assigned;
  String? details;
  String? multimedia;
  String? stateticket;
  DateTime? createdAt;
  DateTime? changeState;

  Ticket({
    this.id,
    required this.userapp,
    required this.details,
    required this.multimedia,
    required this.stateticket,
    this.assigned,
    this.createdAt,
    this.changeState,
  });

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] as int,
      userapp: map['userapp'] as String,
      assigned: map['assigned'] as String,
      details: map['details'] as String,
      multimedia: map['multimedia'] as String,
      stateticket: map['stateticket'] as String,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      changeState: map['changeState'] != null
          ? DateTime.parse(map['changeState'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userapp': userapp,
      'details': details,
      'multimedia': multimedia,
      'stateticket': stateticket,
      'assigned': assigned,
    };
  }
}
