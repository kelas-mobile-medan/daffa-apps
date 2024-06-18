import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:circlestyle/services/api_services.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService _apiService;

  AuthCubit(this._apiService) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      emit(AuthFailed('Username and password are required'));
      return;
    }

    emit(AuthLoading());

    try {
      final success = await _apiService.login(username, password);

      if (success) {
        emit(AuthSuccess(username));
      } else {
        emit(AuthFailed('Invalid username or password'));
      }
    } on Exception catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
