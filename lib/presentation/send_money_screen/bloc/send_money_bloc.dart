import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/send_money_screen/models/send_money_model.dart';
part 'send_money_event.dart';
part 'send_money_state.dart';

/// A bloc that manages the state of a SendMoney according to the event that is dispatched to it.
class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc(SendMoneyState initialState) : super(initialState) {
    on<SendMoneyInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _onInitialize(
    SendMoneyInitialEvent event,
    Emitter<SendMoneyState> emit,
  ) async {
    emit(state.copyWith(
        sendMoneyModelObj: state.sendMoneyModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SendMoneyState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }
}
