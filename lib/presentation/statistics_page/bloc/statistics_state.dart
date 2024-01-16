// ignore_for_file: must_be_immutable

part of 'statistics_bloc.dart';

/// Represents the state of Statistics in the application.
class StatisticsState extends Equatable {
  StatisticsState({this.statisticsModelObj});

  StatisticsModel? statisticsModelObj;

  @override
  List<Object?> get props => [
        statisticsModelObj,
      ];
  StatisticsState copyWith({StatisticsModel? statisticsModelObj}) {
    return StatisticsState(
      statisticsModelObj: statisticsModelObj ?? this.statisticsModelObj,
    );
  }
}
