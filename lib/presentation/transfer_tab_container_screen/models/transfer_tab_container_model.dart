// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'transfertabcontainer_item_model.dart';

/// This class defines the variables used in the [transfer_tab_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TransferTabContainerModel extends Equatable {
  TransferTabContainerModel({this.transfertabcontainerItemList = const []}) {}

  List<TransfertabcontainerItemModel> transfertabcontainerItemList;

  TransferTabContainerModel copyWith(
      {List<TransfertabcontainerItemModel>? transfertabcontainerItemList}) {
    return TransferTabContainerModel(
      transfertabcontainerItemList:
          transfertabcontainerItemList ?? this.transfertabcontainerItemList,
    );
  }

  @override
  List<Object?> get props => [transfertabcontainerItemList];
}
