import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/transfer_page/models/transfer_model.dart';
part 'transfer_event.dart';
part 'transfer_state.dart';

/// A bloc that manages the state of a Transfer according to the event that is dispatched to it.
class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc(TransferState initialState) : super(initialState) {
    on<TransferInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TransferInitialEvent event,
    Emitter<TransferState> emit,
  ) async {}
}
