class Ticket {
  int? id;
  String? userapp;
  String? details;
  String? multimedia;

  Ticket({
    this.id, 
    required this.userapp, 
    required this.details, 
    required this.multimedia
    });

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] as int,
      userapp: map['userapp'] as String,
      details: map['details'] as String,
      multimedia: map['multimedia'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userapp': userapp,
      'details': details,
      'multimedia': multimedia,
    };
  }
}
