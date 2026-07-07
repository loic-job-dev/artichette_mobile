import 'package:artichette/data/repositories/user_repository.dart';
import 'package:artichette/domain/models/user.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel(this.userRepository);

  final UserRepository userRepository;

  User? _user;

  User? get user => _user;

  Future<void> load() async {
    _user = await userRepository.getMe();
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
