// ignore_for_file: must_be_immutable

part of 'transfer_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TransferTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TransferTabContainerEvent extends Equatable {}

/// Event that is dispatched when the TransferTabContainer widget is first created.
class TransferTabContainerInitialEvent extends TransferTabContainerEvent {
  @override
  List<Object?> get props => [];
}
