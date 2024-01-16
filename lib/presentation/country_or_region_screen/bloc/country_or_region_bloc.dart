import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/countryorregion_item_model.dart';
import 'package:windy_sabtami_s_application1/presentation/country_or_region_screen/models/country_or_region_model.dart';
part 'country_or_region_event.dart';
part 'country_or_region_state.dart';

/// A bloc that manages the state of a CountryOrRegion according to the event that is dispatched to it.
class CountryOrRegionBloc
    extends Bloc<CountryOrRegionEvent, CountryOrRegionState> {
  CountryOrRegionBloc(CountryOrRegionState initialState) : super(initialState) {
    on<CountryOrRegionInitialEvent>(_onInitialize);
  }

  List<CountryorregionItemModel> fillCountryorregionItemList() {
    return [
      CountryorregionItemModel(
          unitedKingdom: ImageConstant.imgComponent2,
          unitedKingdom1: "United Kingdom"),
      CountryorregionItemModel(
          unitedKingdom: ImageConstant.imgComponent2,
          unitedKingdom1: "Germany"),
      CountryorregionItemModel(
          unitedKingdom: ImageConstant.imgComponent2, unitedKingdom1: "France"),
      CountryorregionItemModel(
          unitedKingdom: ImageConstant.imgUnitedKingdom,
          unitedKingdom1: "United States"),
      CountryorregionItemModel(
          unitedKingdom: ImageConstant.imgComponent2, unitedKingdom1: "Italy"),
      CountryorregionItemModel(
          unitedKingdom: ImageConstant.imgComponent2,
          unitedKingdom1: "Portugal"),
      CountryorregionItemModel(
          unitedKingdom: ImageConstant.imgComponent2, unitedKingdom1: "Brazil")
    ];
  }

  _onInitialize(
    CountryOrRegionInitialEvent event,
    Emitter<CountryOrRegionState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        countryOrRegionModelObj: state.countryOrRegionModelObj?.copyWith(
            countryorregionItemList: fillCountryorregionItemList())));
  }
}
