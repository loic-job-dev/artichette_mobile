class Room {
  final String id;
  final int number;

  const Room({
    required this.id,
    required this.number,
  });

  String get displayName => "Chambre $number";

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      number: json['number'],
    );
  }
}