import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/thirtytwo_item_model.dart';
import '../models/twenty_item_model.dart';
import 'package:windy_sabtami_s_application1/presentation/mine_page/models/mine_model.dart';
part 'mine_event.dart';
part 'mine_state.dart';

/// A bloc that manages the state of a Mine according to the event that is dispatched to it.
class MineBloc extends Bloc<MineEvent, MineState> {
  MineBloc(MineState initialState) : super(initialState) {
    on<MineInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MineInitialEvent event,
    Emitter<MineState> emit,
  ) async {
    emit(state.copyWith(
        mineModelObj: state.mineModelObj?.copyWith(
            thirtytwoItemList: fillThirtytwoItemList(),
            twentyItemList: fillTwentyItemList())));
  }

  List<ThirtytwoItemModel> fillThirtytwoItemList() {
    return [ThirtytwoItemModel(frame: ImageConstant.imgFrame2261)];
  }

  List<TwentyItemModel> fillTwentyItemList() {
    return [
      TwentyItemModel(
          vector: ImageConstant.imgVector,
          appleStore: "Apple Store",
          june: "21 June, 2022",
          price: "-220.00"),
      TwentyItemModel(
          vector: ImageConstant.imgThumbsUp,
          appleStore: "Netflix",
          june: "20 June, 2022",
          price: "-170.00"),
      TwentyItemModel(
          vector: ImageConstant.imgIcon50x50,
          appleStore: "Spotify",
          june: "20 June, 2022",
          price: "-54.00"),
      TwentyItemModel(
          vector: ImageConstant.imgVectorPink400,
          appleStore: "Dribbble",
          june: "18 June, 2022",
          price: "-107.00")
    ];
  }
}
