import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_form_state.dart';

class CustomFormCubit extends Cubit<CustomFormState> {
  CustomFormCubit() : super(CustomFormInitial());
  bool isObstruct = true;
  void showOrHidePassword() {
    isObstruct = !isObstruct;
    emit(CustomFormChangeInitial());
  }

  bool getObstruct() {
    return isObstruct;
  }
}
