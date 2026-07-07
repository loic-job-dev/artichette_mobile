import 'package:artichette/domain/models/room_type.dart';

class RoomtypeMock {
  static RoomType getMockRoomType() {
     final roomTypeTestPictures = [
      "assets/pictures/rooms/DLX2.png",
      "assets/pictures/rooms/DLX3.png",
      "assets/pictures/rooms/DLX4.png",
    ];

    final roomTypeTestFullPictures = [
      "assets/pictures/rooms/STE2.png",
      "assets/pictures/rooms/STE3.png",
      "assets/pictures/rooms/STE4.png",
    ];

    return RoomType(
          id: "1",
          type: "STD",
          description: "Chambre standard avec vue sur le jardin",
          availability: true,
          price: 450,
          pictures: roomTypeTestFullPictures,
          details: '1 Lit Queen Size'
        );
      }
}