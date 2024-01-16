// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:windy_sabtami_s_application1/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [statistics_tab_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class StatisticsTabContainerModel extends Equatable {
  StatisticsTabContainerModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  StatisticsTabContainerModel copyWith(
      {List<SelectionPopupModel>? dropdownItemList}) {
    return StatisticsTabContainerModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
