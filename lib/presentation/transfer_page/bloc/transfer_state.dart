// ignore_for_file: must_be_immutable

part of 'transfer_bloc.dart';

/// Represents the state of Transfer in the application.
class TransferState extends Equatable {
  TransferState({this.transferModelObj});

  TransferModel? transferModelObj;

  @override
  List<Object?> get props => [
        transferModelObj,
      ];
  TransferState copyWith({TransferModel? transferModelObj}) {
    return TransferState(
      transferModelObj: transferModelObj ?? this.transferModelObj,
    );
  }
}
