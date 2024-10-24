import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ImagePickerSuccess(File(pickedFile.path)));
      } else {
        emit(ImagePickerFailure());
      }
    } catch (e) {
      emit(ImagePickerFailure());
    }
  }
}
