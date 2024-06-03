import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

///To capture Image from Camera
class CameraCapture extends ImagePickerEvent{}


///To capture Image from Gallery
class GalleryImageCapture extends ImagePickerEvent{}
