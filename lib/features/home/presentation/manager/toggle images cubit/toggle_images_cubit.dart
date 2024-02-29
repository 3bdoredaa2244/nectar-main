import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_images_state.dart';

class ToggleImagesCubit extends Cubit<ToggleImagesState> {
  ToggleImagesCubit() : super(ToggleImagesInitial());

  static ToggleImagesCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndexValue(int value) {
    currentIndex = value;
    emit(ToggleImagesSuccess());
  }
}
