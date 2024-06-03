import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  const FavouriteItemModel({
    required this.id,
    required this.value,
    this.isFavourite = false,
  });

  final String id;
  final String value;
  final bool isFavourite;

  FavouriteItemModel copyWith({String? id, String? value, bool? isFavourite}) {
    return FavouriteItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object> get props => [id, value, isFavourite];
}
