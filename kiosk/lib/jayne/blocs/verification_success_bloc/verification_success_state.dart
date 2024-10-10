import 'package:equatable/equatable.dart';

enum VerificationSuccessStatus {
  init,
}
class VerificationSuccessState extends Equatable {
  final VerificationSuccessStatus status;

  const VerificationSuccessState({
    this.status = VerificationSuccessStatus.init,
  });

  VerificationSuccessState copyWith({
    VerificationSuccessStatus? status,
  }) {
    return VerificationSuccessState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
