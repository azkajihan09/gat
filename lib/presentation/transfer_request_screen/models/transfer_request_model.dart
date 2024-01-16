// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'transferrequest_item_model.dart';

/// This class defines the variables used in the [transfer_request_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TransferRequestModel extends Equatable {
  TransferRequestModel({this.transferrequestItemList = const []}) {}

  List<TransferrequestItemModel> transferrequestItemList;

  TransferRequestModel copyWith(
      {List<TransferrequestItemModel>? transferrequestItemList}) {
    return TransferRequestModel(
      transferrequestItemList:
          transferrequestItemList ?? this.transferrequestItemList,
    );
  }

  @override
  List<Object?> get props => [transferrequestItemList];
}
