import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/mine_page_container_screen/models/mine_page_container_model.dart';
part 'mine_page_container_event.dart';
part 'mine_page_container_state.dart';

/// A bloc that manages the state of a MinePageContainer according to the event that is dispatched to it.
class MinePageContainerBloc
    extends Bloc<MinePageContainerEvent, MinePageContainerState> {
  MinePageContainerBloc(MinePageContainerState initialState)
      : super(initialState) {
    on<MinePageContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MinePageContainerInitialEvent event,
    Emitter<MinePageContainerState> emit,
  ) async {}
}
