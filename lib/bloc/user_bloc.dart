import '../DataModel/user.dart';
import '../Repository/user_repository.dart';
import 'bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<BlocState> {
  User? _user;

  UserBloc() : super(Initial());

  void authenticate(String mobile, String pass) async {
    if (state is Loading) return;

    try {
      emit(Loading());
      _user = await UserRepo.authenticate(mobile, pass);
      emit(Authenticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void signOut() => emit(Initial());

  User? get user => _user;
}
