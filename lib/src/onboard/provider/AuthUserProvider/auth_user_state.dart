import 'package:equatable/equatable.dart';

class AuthUserState extends Equatable {
  const AuthUserState({
    required this.isLoading,
    this.errorMessage,
    this.userDetails,
  });

  final bool isLoading;
  final String? errorMessage;
  final String?  userDetails;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        userDetails,
      ];
}
