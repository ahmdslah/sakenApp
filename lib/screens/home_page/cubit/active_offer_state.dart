part of 'active_offer_cubit.dart';

@immutable
sealed class ActiveOfferState {}

final class ActiveOfferInitial extends ActiveOfferState {}

final class ActiveOfferLoading extends ActiveOfferState {}

final class ActiveOfferSuccess extends ActiveOfferState {
  final List<ActiveOfferModel> activeOffer;

  ActiveOfferSuccess(this.activeOffer);
}

final class ActiveOfferErorr extends ActiveOfferState {
  final String erorr;

  ActiveOfferErorr(this.erorr);
}
