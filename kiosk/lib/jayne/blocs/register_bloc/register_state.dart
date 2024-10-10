import 'package:equatable/equatable.dart';

enum RegisterStatus {
  init,
}
class RegisterState extends Equatable {
  final RegisterStatus status;

  const RegisterState({
    this.status = RegisterStatus.init,
  });

  RegisterState copyWith({
    RegisterStatus? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
