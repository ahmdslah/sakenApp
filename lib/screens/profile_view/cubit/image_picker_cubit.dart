import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  Uint8List? selectedImage;
  ImagePickerCubit() : super(ImagePickerInitial());
  Future<void> pickkImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imageData =
          await image.readAsBytes(); // قراءة بيانات الصورة كـ Uint8List

      selectedImage = imageData; // تحديث الصورة في واجهة المستخدم
      emit(ImagePicked());
    }
  }
}
