// ignore_for_file: must_be_immutable

part of 'national_bank_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NationalBank widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NationalBankEvent extends Equatable {}

/// Event that is dispatched when the NationalBank widget is first created.
class NationalBankInitialEvent extends NationalBankEvent {
  @override
  List<Object?> get props => [];
}
