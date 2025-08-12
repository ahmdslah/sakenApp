import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/helpers/dio_helper.dart';
import 'package:saken_mobile/screens/home_page/models/higest_price_model/higest_price_model.dart';

part 'higest_price_state.dart';

class HigestPriceCubit extends Cubit<HigestPriceState> {
  HigestPriceCubit() : super(HigestPriceInitial());

  List<HigestPriceModel> hiestPriceList = [];
  final HigestPriceModel higestPriceModel = HigestPriceModel();

  Future<void> getItems() async {
    emit(HigestPriceLoading());
    try {
      final response = await DioHelper.getUrls(Url: 'Housing/highest-rating');
      print("API Response: ${response.data}");
      if (response.data is List) {
        hiestPriceList = (response.data as List)
            .map((item) => HigestPriceModel.fromJson(item))
            .toList();
        emit(HigestPriceSuccess(hiestPriceList));
      } else {
        emit(HigestPriceError('Invalid response format'));
      }
    } catch (e) {
      if (hiestPriceList.isNotEmpty) {
        emit(HigestPriceSuccess(hiestPriceList));
      } else {
        emit(HigestPriceError('Invalid response format'));
      }
    }
  }
}
