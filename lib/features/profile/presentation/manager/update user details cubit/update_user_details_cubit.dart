import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'update_user_details_state.dart';

class UpdateUserDetailsCubit extends Cubit<UpdateUserDetailsState> {
  UpdateUserDetailsCubit() : super(UpdateUserDetailsInitial());
}
