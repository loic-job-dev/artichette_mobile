class Room {
  final String id;
  final int number;

  const Room({
    required this.id,
    required this.number,
  });

  String get displayName => "Chambre $number";
}