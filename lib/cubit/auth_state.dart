class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String username;
  AuthSuccess(this.username);
}

class AuthFailed extends AuthState {
  final String message;
  AuthFailed(this.message);
}
