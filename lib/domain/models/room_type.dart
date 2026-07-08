class RoomType {
  final String id;
  final String type;
  final String description;
  final bool availability;
  final int price;
  final List<String> pictures;
  final String details;

  RoomType({
    required this.id,
    required this.type,
    required this.description,
    required this.availability,
    required this.price,
    required this.pictures,
    required this.details,
  });

  static List<String> _getPictures(String type) {
    switch (type) {
      case 'STD':
        return [
          "assets/pictures/rooms/STD2.png",
          "assets/pictures/rooms/STD3.png",
          "assets/pictures/rooms/STD4.jpg",
        ];
      case 'DLX':
        return [
          "assets/pictures/rooms/DLX2.png",
          "assets/pictures/rooms/DLX3.png",
          "assets/pictures/rooms/DLX4.png",
        ];
      case 'STE':
        return [
          "assets/pictures/rooms/STE2.png",
          "assets/pictures/rooms/STE3.png",
          "assets/pictures/rooms/STE4.png",
        ];
      default:
        return [
          "assets/pictures/rooms/STD2.png",
          "assets/pictures/rooms/STD3.png",
          "assets/pictures/rooms/STD4.jpg",
        ];
    }
  }
/*
  static String _getNameFromType(String type) {
      switch (type) {
        case 'STD':
          return "Chambre standard";

        case 'DLX':
          return "Chambre deluxe";

          case 'STE':
            return "Suite";

        default:
          return "";
      }
  }
*/
  static String _getDetails(String type) {
    switch (type) {
      case 'STD':
        return "1 Lit King Size";

      case 'DLX':
        return "1 Lit Queen Size";

      case 'STE':
        return "Jacuzzi privatif inclus";

      default:
        return "";
    }
  }

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      id: json['Id'],
      type: json['type'],
      description: json['description'],
      availability: json['availability'],
      price: json['price'],
        pictures: _getPictures(json['type']),
      details: _getDetails(json['type'])
    );
  }

  String get priceDisplay =>
      "${(price / 100).toStringAsFixed(2)} €";

  String get priceToFixDisplay =>
      "${price.toString()} € / nuit";
}

