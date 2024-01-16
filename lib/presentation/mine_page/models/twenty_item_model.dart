import '../../../core/app_export.dart';

/// This class is used in the [twenty_item_widget] screen.
class TwentyItemModel {
  TwentyItemModel({
    this.vector,
    this.appleStore,
    this.june,
    this.price,
    this.id,
  }) {
    vector = vector ?? ImageConstant.imgVector;
    appleStore = appleStore ?? "Apple Store";
    june = june ?? "21 June, 2022";
    price = price ?? "-220.00";
    id = id ?? "";
  }

  String? vector;

  String? appleStore;

  String? june;

  String? price;

  String? id;
}
