// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:windy_sabtami_s_application1/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [send_money_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SendMoneyModel extends Equatable {
  SendMoneyModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  SendMoneyModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return SendMoneyModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
