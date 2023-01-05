part of 'password_cubit.dart';

@immutable
abstract class PasswordState {}

class PasswordInitial extends PasswordState {}


class NumberWarning extends PasswordState {
  final int numberWarning;

  NumberWarning(this.numberWarning);
}

class ReValidate extends PasswordState {
  final List<bool> validations;

  ReValidate(this.validations);
}
