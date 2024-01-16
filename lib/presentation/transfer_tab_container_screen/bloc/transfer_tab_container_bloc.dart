import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/transfertabcontainer_item_model.dart';
import 'package:windy_sabtami_s_application1/presentation/transfer_tab_container_screen/models/transfer_tab_container_model.dart';
part 'transfer_tab_container_event.dart';
part 'transfer_tab_container_state.dart';

/// A bloc that manages the state of a TransferTabContainer according to the event that is dispatched to it.
class TransferTabContainerBloc
    extends Bloc<TransferTabContainerEvent, TransferTabContainerState> {
  TransferTabContainerBloc(TransferTabContainerState initialState)
      : super(initialState) {
    on<TransferTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TransferTabContainerInitialEvent event,
    Emitter<TransferTabContainerState> emit,
  ) async {
    emit(state.copyWith(
        transferTabContainerModelObj: state.transferTabContainerModelObj
            ?.copyWith(
                transfertabcontainerItemList:
                    fillTransfertabcontainerItemList())));
  }

  List<TransfertabcontainerItemModel> fillTransfertabcontainerItemList() {
    return [
      TransfertabcontainerItemModel(ellipse: ImageConstant.imgEllipse309),
      TransfertabcontainerItemModel(ellipse: ImageConstant.imgEllipse310),
      TransfertabcontainerItemModel(ellipse: ImageConstant.imgEllipse313),
      TransfertabcontainerItemModel(ellipse: ImageConstant.imgEllipse312),
      TransfertabcontainerItemModel(ellipse: ImageConstant.imgEllipse311)
    ];
  }
}
