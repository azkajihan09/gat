// ignore_for_file: must_be_immutable

part of 'atm_location_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AtmLocation widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AtmLocationEvent extends Equatable {}

/// Event that is dispatched when the AtmLocation widget is first created.
class AtmLocationInitialEvent extends AtmLocationEvent {
  @override
  List<Object?> get props => [];
}
