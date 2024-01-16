import '../../../core/app_export.dart';

/// This class is used in the [transferrequest_item_widget] screen.
class TransferrequestItemModel {
  TransferrequestItemModel({
    this.zanderWiza,
    this.zanderWiza1,
    this.uIUXDesigner,
    this.id,
  }) {
    zanderWiza = zanderWiza ?? ImageConstant.imgRectangle63;
    zanderWiza1 = zanderWiza1 ?? "Zander Wiza";
    uIUXDesigner = uIUXDesigner ?? "UI/UX Designer";
    id = id ?? "";
  }

  String? zanderWiza;

  String? zanderWiza1;

  String? uIUXDesigner;

  String? id;
}
