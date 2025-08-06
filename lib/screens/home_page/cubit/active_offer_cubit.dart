import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/helpers/dio_helper.dart';
import 'package:saken_mobile/screens/home_page/models/active_offer_model/active_offer_model.dart';

part 'active_offer_state.dart';

class ActiveOfferCubit extends Cubit<ActiveOfferState> {
  ActiveOfferCubit() : super(ActiveOfferInitial());
  List<ActiveOfferModel> activeOfferList = [];
  final ActiveOfferModel activeOfferModel = ActiveOfferModel();
  Future<void> getItems() async {
    emit(ActiveOfferLoading());
    try {
      final response = await DioHelper.getUrls(Url: 'HousingOffers/ActiveOffer');
      print("API Response: ${response.data}");
      if (response.data is List) {
        activeOfferList = (response.data as List)
            .map((item) => ActiveOfferModel.fromJson(item))
            .toList();
        emit(ActiveOfferSuccess(activeOfferList));
      } else {
        emit(ActiveOfferErorr('Invalid response format'));
      }
    } catch (e) {
      if (activeOfferList.isNotEmpty) {
        emit(ActiveOfferSuccess(activeOfferList));
      } else {
        emit(ActiveOfferErorr('Invalid response format'));
      }
    }
  }
}
