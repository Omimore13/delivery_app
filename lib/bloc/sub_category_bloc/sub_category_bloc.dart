import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sub_category_event.dart';
part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  SubCategoryBloc() : super(SubCategoryInitial()) {
    on<SubCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
