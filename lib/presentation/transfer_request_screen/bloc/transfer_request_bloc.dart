import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/transferrequest_item_model.dart';
import 'package:windy_sabtami_s_application1/presentation/transfer_request_screen/models/transfer_request_model.dart';
part 'transfer_request_event.dart';
part 'transfer_request_state.dart';

/// A bloc that manages the state of a TransferRequest according to the event that is dispatched to it.
class TransferRequestBloc
    extends Bloc<TransferRequestEvent, TransferRequestState> {
  TransferRequestBloc(TransferRequestState initialState) : super(initialState) {
    on<TransferRequestInitialEvent>(_onInitialize);
  }

  List<TransferrequestItemModel> fillTransferrequestItemList() {
    return [
      TransferrequestItemModel(
          zanderWiza: ImageConstant.imgRectangle63,
          zanderWiza1: "Zander Wiza",
          uIUXDesigner: "UI/UX Designer"),
      TransferrequestItemModel(
          zanderWiza: ImageConstant.imgRectangle64,
          zanderWiza1: "Devon Jerde",
          uIUXDesigner: "Product Designer"),
      TransferrequestItemModel(
          zanderWiza: ImageConstant.imgRectangle65,
          zanderWiza1: "Alvis Blick",
          uIUXDesigner: "Graphic Designer"),
      TransferrequestItemModel(
          zanderWiza: ImageConstant.imgRectangle66,
          zanderWiza1: "Kira Kulas",
          uIUXDesigner: "Graphic Designer"),
      TransferrequestItemModel(
          zanderWiza: ImageConstant.imgRectangle67,
          zanderWiza1: "Mara Wilkinson",
          uIUXDesigner: "Project Manager")
    ];
  }

  _onInitialize(
    TransferRequestInitialEvent event,
    Emitter<TransferRequestState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        transferRequestModelObj: state.transferRequestModelObj?.copyWith(
            transferrequestItemList: fillTransferrequestItemList())));
  }
}
