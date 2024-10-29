import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/edit_profile_state.dart';

class EditProfileBloc extends Cubit<EditProfileState> {
  EditProfileBloc()
      : super(EditProfileState(
          walletBalance: TextEditingController(),
        ));

  void setDefaultValue(String value){
    state.walletBalance.text = value;
  }
}
