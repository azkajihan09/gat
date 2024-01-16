import '../../../core/app_export.dart';

/// This class is used in the [countryorregion_item_widget] screen.
class CountryorregionItemModel {
  CountryorregionItemModel({
    this.unitedKingdom,
    this.unitedKingdom1,
    this.id,
  }) {
    unitedKingdom = unitedKingdom ?? ImageConstant.imgComponent2;
    unitedKingdom1 = unitedKingdom1 ?? "United Kingdom";
    id = id ?? "";
  }

  String? unitedKingdom;

  String? unitedKingdom1;

  String? id;
}
