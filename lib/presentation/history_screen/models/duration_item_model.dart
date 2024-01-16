import '../../../core/app_export.dart';

/// This class is used in the [duration_item_widget] screen.
class DurationItemModel {
  DurationItemModel({
    this.groupBy,
    this.id,
  }) {
    groupBy = groupBy ?? "";
    id = id ?? "";
  }

  String? groupBy;

  String? id;
}
