// ignore_for_file: must_be_immutable

part of 'currency_exchange_bloc.dart';

/// Represents the state of CurrencyExchange in the application.
class CurrencyExchangeState extends Equatable {
  CurrencyExchangeState({
    this.priceController,
    this.commentController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.currencyExchangeModelObj,
  });

  TextEditingController? priceController;

  TextEditingController? commentController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  CurrencyExchangeModel? currencyExchangeModelObj;

  @override
  List<Object?> get props => [
        priceController,
        commentController,
        selectedDropDownValue,
        selectedDropDownValue1,
        currencyExchangeModelObj,
      ];
  CurrencyExchangeState copyWith({
    TextEditingController? priceController,
    TextEditingController? commentController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    CurrencyExchangeModel? currencyExchangeModelObj,
  }) {
    return CurrencyExchangeState(
      priceController: priceController ?? this.priceController,
      commentController: commentController ?? this.commentController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      currencyExchangeModelObj:
          currencyExchangeModelObj ?? this.currencyExchangeModelObj,
    );
  }
}
