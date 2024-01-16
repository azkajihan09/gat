import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/atm_location_screen/models/atm_location_model.dart';
part 'atm_location_event.dart';
part 'atm_location_state.dart';

/// A bloc that manages the state of a AtmLocation according to the event that is dispatched to it.
class AtmLocationBloc extends Bloc<AtmLocationEvent, AtmLocationState> {
  AtmLocationBloc(AtmLocationState initialState) : super(initialState) {
    on<AtmLocationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AtmLocationInitialEvent event,
    Emitter<AtmLocationState> emit,
  ) async {}
}
