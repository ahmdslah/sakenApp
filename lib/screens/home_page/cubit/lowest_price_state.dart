part of 'lowest_price_cubit.dart';

@immutable
sealed class LowestPriceState {}

final class LowestPriceInitial extends LowestPriceState {}

final class LowestPriceLoading extends LowestPriceState {}

final class LowestPriceSuccess extends LowestPriceState {
  final List<LowestPriceModel> lowestPrice;

  LowestPriceSuccess(this.lowestPrice);
}

final class LowestPriceErorr extends LowestPriceState {
  final String erorr;

  LowestPriceErorr(this.erorr);
}
