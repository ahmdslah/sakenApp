import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saken_mobile/screens/New%20pass%20Screen/helpers/dio_helper.dart';
import 'package:saken_mobile/screens/home_page/models/sakan_model/sakan_model.dart';

part 'sakan_state.dart';

class SakanCubit extends Cubit<SakanState> {
  SakanCubit() : super(SakanInitial());

  List<SakanModel> sakanList = [];
  final SakanModel sakanModel = SakanModel();
  Future<void> getItems() async {
    emit(SakanLoading());
    try {
      final response = await DioHelper.getUrls(Url: 'Housing/AllHouses');
      print("API Response: ${response.data}");
      if (response.data is List) {
        sakanList = (response.data as List)
            .map((item) => SakanModel.fromJson(item))
            .toList();
        emit(SakanSuccess(sakanList));
      } else {
        SakanErorr('Invalid response format');
      }
    } catch (e) {
      if(sakanList.isNotEmpty){
        emit(SakanSuccess(sakanList));
      }else{
        SakanErorr('Invalid response format');
      }
    }
  }
}
