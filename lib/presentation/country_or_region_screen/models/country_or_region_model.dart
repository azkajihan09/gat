// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'countryorregion_item_model.dart';

/// This class defines the variables used in the [country_or_region_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CountryOrRegionModel extends Equatable {
  CountryOrRegionModel({this.countryorregionItemList = const []}) {}

  List<CountryorregionItemModel> countryorregionItemList;

  CountryOrRegionModel copyWith(
      {List<CountryorregionItemModel>? countryorregionItemList}) {
    return CountryOrRegionModel(
      countryorregionItemList:
          countryorregionItemList ?? this.countryorregionItemList,
    );
  }

  @override
  List<Object?> get props => [countryorregionItemList];
}
