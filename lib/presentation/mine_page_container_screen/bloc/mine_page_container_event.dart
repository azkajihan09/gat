// ignore_for_file: must_be_immutable

part of 'mine_page_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MinePageContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MinePageContainerEvent extends Equatable {}

/// Event that is dispatched when the MinePageContainer widget is first created.
class MinePageContainerInitialEvent extends MinePageContainerEvent {
  @override
  List<Object?> get props => [];
}
