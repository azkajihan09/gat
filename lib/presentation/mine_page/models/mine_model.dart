// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'thirtytwo_item_model.dart';
import 'twenty_item_model.dart';

/// This class defines the variables used in the [mine_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MineModel extends Equatable {
  MineModel({
    this.thirtytwoItemList = const [],
    this.twentyItemList = const [],
  }) {}

  List<ThirtytwoItemModel> thirtytwoItemList;

  List<TwentyItemModel> twentyItemList;

  MineModel copyWith({
    List<ThirtytwoItemModel>? thirtytwoItemList,
    List<TwentyItemModel>? twentyItemList,
  }) {
    return MineModel(
      thirtytwoItemList: thirtytwoItemList ?? this.thirtytwoItemList,
      twentyItemList: twentyItemList ?? this.twentyItemList,
    );
  }

  @override
  List<Object?> get props => [thirtytwoItemList, twentyItemList];
}
