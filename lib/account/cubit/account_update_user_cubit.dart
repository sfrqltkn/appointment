import 'package:appointment/data/repository/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountUpdateCubit extends Cubit<void> {
  AccountUpdateCubit() : super(0);

  var userRepo = UsersRepository();

  Future<void> update(String userId, String firstname, String lastname,
      String phoneNumber, String email) async {
    await userRepo.update(userId, firstname, lastname, phoneNumber, email);
  }
}
