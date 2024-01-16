// ignore_for_file: must_be_immutable

part of 'statistics_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///StatisticsTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StatisticsTabContainerEvent extends Equatable {}

/// Event that is dispatched when the StatisticsTabContainer widget is first created.
class StatisticsTabContainerInitialEvent extends StatisticsTabContainerEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends StatisticsTabContainerEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
