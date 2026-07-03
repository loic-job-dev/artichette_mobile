import 'package:intl/intl.dart';
import '../../domain/models/room_type.dart';
import '../api/room_api.dart';

class RoomsRepository {
  final RoomsApi api;

  RoomsRepository(this.api);

  final _formatter = DateFormat('yyyy-MM-dd');

  String _format(DateTime d) => _formatter.format(d);

  Future<List<RoomType>> getAvailability({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final data = await api.getAvailability(
      startDate: _format(startDate),
      endDate: _format(endDate),
    );

    return data.map<RoomType>((json) {
      return RoomType.fromJson(json);
    }).toList();
  }
}