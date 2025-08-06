import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/helpers/dio_helper.dart';
import 'package:saken_mobile/screens/home_page/models/lowest_price_model/lowest_price_model.dart';

part 'lowest_price_state.dart';

class LowestPriceCubit extends Cubit<LowestPriceState> {
  LowestPriceCubit() : super(LowestPriceInitial());
  List<LowestPriceModel> lowestPriceList = [];
  final LowestPriceModel lowestPriceModel = LowestPriceModel();

  Future<void> getItems() async {
    emit(LowestPriceLoading());
    try {
      final response = await DioHelper.getUrls(Url: 'Housing/lowest-price');
      print("API Response: ${response.data}");
      if (response.data is List) {
        lowestPriceList = (response.data as List)
            .map((item) => LowestPriceModel.fromJson(item))
            .toList();
        emit(LowestPriceSuccess(lowestPriceList));
      } else {
        emit(LowestPriceErorr('Invalid response format'));
      }
    } catch (e) {
      if(lowestPriceList.isNotEmpty){
        emit(LowestPriceSuccess(lowestPriceList));
      }else{
        emit(LowestPriceErorr('Invalid response format'));
      }
    }
  }
}
