import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/duration_item_model.dart';
import 'package:windy_sabtami_s_application1/presentation/history_screen/models/history_model.dart';
part 'history_event.dart';
part 'history_state.dart';

/// A bloc that manages the state of a History according to the event that is dispatched to it.
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(HistoryState initialState) : super(initialState) {
    on<HistoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HistoryInitialEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(
        historyModelObj: state.historyModelObj
            ?.copyWith(durationItemList: fillDurationItemList())));
  }

  List<DurationItemModel> fillDurationItemList() {
    return [
      DurationItemModel(groupBy: "Today, 25 June"),
      DurationItemModel(groupBy: "Today, 25 June"),
      DurationItemModel(groupBy: "Today, 25 June"),
      DurationItemModel(groupBy: "Today, 25 June"),
      DurationItemModel(groupBy: "Yesterday"),
      DurationItemModel(groupBy: "Yesterday"),
      DurationItemModel(groupBy: "Yesterday"),
      DurationItemModel(groupBy: "20 June, 2022"),
      DurationItemModel(groupBy: "20 June, 2022")
    ];
  }
}
