import 'package:bloc/bloc.dart';
import 'package:delivery_app/bloc/payment_bloc/payment_events.dart';
import 'package:delivery_app/bloc/payment_bloc/payment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ///Dependency Injection used "imagePickerUtils"
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImageCapture>(_galleryCapture);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryCapture(
      GalleryImageCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.imageFromGallery();
    emit(state.copyWith(file: file));
  }
}
