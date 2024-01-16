// ignore_for_file: must_be_immutable

part of 'country_or_region_bloc.dart';

/// Represents the state of CountryOrRegion in the application.
class CountryOrRegionState extends Equatable {
  CountryOrRegionState({
    this.searchController,
    this.countryOrRegionModelObj,
  });

  TextEditingController? searchController;

  CountryOrRegionModel? countryOrRegionModelObj;

  @override
  List<Object?> get props => [
        searchController,
        countryOrRegionModelObj,
      ];
  CountryOrRegionState copyWith({
    TextEditingController? searchController,
    CountryOrRegionModel? countryOrRegionModelObj,
  }) {
    return CountryOrRegionState(
      searchController: searchController ?? this.searchController,
      countryOrRegionModelObj:
          countryOrRegionModelObj ?? this.countryOrRegionModelObj,
    );
  }
}
