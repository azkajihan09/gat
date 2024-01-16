// ignore_for_file: must_be_immutable

part of 'country_or_region_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CountryOrRegion widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CountryOrRegionEvent extends Equatable {}

/// Event that is dispatched when the CountryOrRegion widget is first created.
class CountryOrRegionInitialEvent extends CountryOrRegionEvent {
  @override
  List<Object?> get props => [];
}
