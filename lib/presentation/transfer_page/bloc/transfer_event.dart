// ignore_for_file: must_be_immutable

part of 'transfer_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Transfer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TransferEvent extends Equatable {}

/// Event that is dispatched when the Transfer widget is first created.
class TransferInitialEvent extends TransferEvent {
  @override
  List<Object?> get props => [];
}
