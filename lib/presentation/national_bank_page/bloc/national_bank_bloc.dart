import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:windy_sabtami_s_application1/presentation/national_bank_page/models/national_bank_model.dart';
part 'national_bank_event.dart';
part 'national_bank_state.dart';

/// A bloc that manages the state of a NationalBank according to the event that is dispatched to it.
class NationalBankBloc extends Bloc<NationalBankEvent, NationalBankState> {
  NationalBankBloc(NationalBankState initialState) : super(initialState) {
    on<NationalBankInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NationalBankInitialEvent event,
    Emitter<NationalBankState> emit,
  ) async {}
}
