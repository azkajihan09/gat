// ignore_for_file: must_be_immutable

part of 'login_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LoginPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginPageEvent extends Equatable {}

/// Event that is dispatched when the LoginPage widget is first created.
class LoginPageInitialEvent extends LoginPageEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends LoginPageEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends LoginPageEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
