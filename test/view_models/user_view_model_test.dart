import 'package:artichette/data/repositories/user_repository.dart';
import 'package:artichette/domain/models/user.dart';
import 'package:artichette/view_models/user_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;
  late UserViewModel viewModel;

  User fakeUser() {
    return const User(
      firstName: 'Jean',
      lastName: 'Dupont',
      phoneNumber: '0600000000',
      email: 'fake@mail.com',
      addresses: {},
    );
  }

  setUp(() {
    userRepository = MockUserRepository();
    viewModel = UserViewModel(userRepository);
  });

  test('load retrieves current user successfully', () async {
    final user = fakeUser();

    when(() => userRepository.getMe()).thenAnswer((_) async => user);

    await viewModel.load();

    expect(viewModel.user, user);

    verify(() => userRepository.getMe()).called(1);
  });

  test('updateMe updates current user successfully', () async {
    final updatedUser = const User(
      firstName: 'Jean',
      lastName: 'Martin',
      phoneNumber: '0600000000',
      email: 'fake@mail.com',
      addresses: {},
    );

    when(
      () => userRepository.updateMe(user: updatedUser, password: 'password123'),
    ).thenAnswer((_) async => updatedUser);

    await viewModel.update(user: updatedUser, password: 'password123');

    expect(viewModel.user, updatedUser);

    verify(
      () => userRepository.updateMe(user: updatedUser, password: 'password123'),
    ).called(1);
  });

  test('clear removes current user', () {
    viewModel.clear();

    expect(viewModel.user, isNull);
  });

  test('load propagates repository exception', () async {
    when(() => userRepository.getMe()).thenThrow(Exception('API error'));

    expect(() => viewModel.load(), throwsException);
  });

  test('update propagates repository exception', () async {
    final user = fakeUser();

    when(
      () => userRepository.updateMe(user: user, password: 'password123'),
    ).thenThrow(Exception('API error'));

    expect(
      () => viewModel.update(user: user, password: 'password123'),
      throwsException,
    );
  });
}
