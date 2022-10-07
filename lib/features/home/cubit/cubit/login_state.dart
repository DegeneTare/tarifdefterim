part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController? emailLoginController = TextEditingController();

  final TextEditingController? passwordLoginController =
      TextEditingController();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
