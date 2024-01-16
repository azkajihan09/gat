// ignore_for_file: must_be_immutable

part of 'statistics_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Statistics widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StatisticsEvent extends Equatable {}

/// Event that is dispatched when the Statistics widget is first created.
class StatisticsInitialEvent extends StatisticsEvent {
  @override
  List<Object?> get props => [];
}
