import 'package:artichette/data/api/room_api.dart';
import 'package:artichette/data/repositories/room_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRoomsApi extends Mock implements RoomsApi {}

void main() {

  late MockRoomsApi api;
  late RoomsRepository repository;


  setUp(() {
    api = MockRoomsApi();
    repository = RoomsRepository(api);
  });


  test('formats dates and returns rooms', () async {

    when(() => api.getAvailability(
      startDate: '2026-01-01',
      endDate: '2026-01-05',
    )).thenAnswer((_) async => [
      {
        'Id': '1',
        'type': 'STD',
        'description': 'Standard',
        'availability': true,
        'price': 10000,
      }
    ]);


    final result = await repository.getAvailability(
      startDate: DateTime(2026,1,1),
      endDate: DateTime(2026,1,5),
    );


    expect(result.length, 1);
    expect(result.first.type, 'STD');
  });


  test('propagates api errors', () async {

    when(() => api.getAvailability(
      startDate: any(named: 'startDate'),
      endDate: any(named: 'endDate'),
    )).thenThrow(Exception());


    expect(
          () => repository.getAvailability(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
      ),
      throwsException,
    );
  });
}