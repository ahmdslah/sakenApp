part of 'higest_price_cubit.dart';

@immutable
sealed class HigestPriceState {}

final class HigestPriceInitial extends HigestPriceState {}

final class HigestPriceLoading extends HigestPriceState {}

final class HigestPriceSuccess extends HigestPriceState {
  final List<HigestPriceModel> higestPrice;

  HigestPriceSuccess(this.higestPrice);
}

final class HigestPriceError extends HigestPriceState {
  final String erorr;

  HigestPriceError(this.erorr);
}
