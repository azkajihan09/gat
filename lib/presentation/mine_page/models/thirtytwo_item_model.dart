import '../../../core/app_export.dart';

/// This class is used in the [thirtytwo_item_widget] screen.
class ThirtytwoItemModel {
  ThirtytwoItemModel({
    this.frame,
    this.id,
  }) {
    frame = frame ?? ImageConstant.imgFrame2261;
    id = id ?? "";
  }

  String? frame;

  String? id;
}
