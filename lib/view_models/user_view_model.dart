import 'package:artichette/data/repositories/user_repository.dart';
import 'package:artichette/domain/models/user.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel(this.userRepository);

  final UserRepository userRepository;

  User? _user;

  User? get user => _user;

  Future<void> load() async {
    debugPrint('load() début');

    _user = await userRepository.getMe();

    debugPrint('user = $_user');

    notifyListeners();

    debugPrint('notifyListeners()');
  }

  Future<void> update({required User user, required String password}) async {
    _user = await userRepository.updateMe(user: user, password: password);
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
