import '../../../core/app_export.dart';

/// This class is used in the [transfertabcontainer_item_widget] screen.
class TransfertabcontainerItemModel {
  TransfertabcontainerItemModel({
    this.ellipse,
    this.id,
  }) {
    ellipse = ellipse ?? ImageConstant.imgEllipse309;
    id = id ?? "";
  }

  String? ellipse;

  String? id;
}
