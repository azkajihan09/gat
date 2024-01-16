// ignore_for_file: must_be_immutable

part of 'atm_location_bloc.dart';

/// Represents the state of AtmLocation in the application.
class AtmLocationState extends Equatable {
  AtmLocationState({this.atmLocationModelObj});

  AtmLocationModel? atmLocationModelObj;

  @override
  List<Object?> get props => [
        atmLocationModelObj,
      ];
  AtmLocationState copyWith({AtmLocationModel? atmLocationModelObj}) {
    return AtmLocationState(
      atmLocationModelObj: atmLocationModelObj ?? this.atmLocationModelObj,
    );
  }
}
