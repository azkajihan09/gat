// ignore_for_file: must_be_immutable

part of 'transfer_tab_container_bloc.dart';

/// Represents the state of TransferTabContainer in the application.
class TransferTabContainerState extends Equatable {
  TransferTabContainerState({this.transferTabContainerModelObj});

  TransferTabContainerModel? transferTabContainerModelObj;

  @override
  List<Object?> get props => [
        transferTabContainerModelObj,
      ];
  TransferTabContainerState copyWith(
      {TransferTabContainerModel? transferTabContainerModelObj}) {
    return TransferTabContainerState(
      transferTabContainerModelObj:
          transferTabContainerModelObj ?? this.transferTabContainerModelObj,
    );
  }
}
