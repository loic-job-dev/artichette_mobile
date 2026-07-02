class RoomType {

  final String type;
  final String description;
  final bool availability;
  final int price;
  final List<String>? pictures;

  const RoomType({
    required this.type,
    required this.description,
    required this.availability,
    required this.price,
    this.pictures
  });

  String get priceDisplay =>
      "${(price / 100).toStringAsFixed(2)} €";

}