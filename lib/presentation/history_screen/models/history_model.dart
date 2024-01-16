// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'duration_item_model.dart';

/// This class defines the variables used in the [history_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HistoryModel extends Equatable {
  HistoryModel({this.durationItemList = const []}) {}

  List<DurationItemModel> durationItemList;

  HistoryModel copyWith({List<DurationItemModel>? durationItemList}) {
    return HistoryModel(
      durationItemList: durationItemList ?? this.durationItemList,
    );
  }

  @override
  List<Object?> get props => [durationItemList];
}
