import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_app/modules/user_profile/event/user_profile_event.dart';
import 'package:flutter_bloc_example_app/modules/user_profile/state/user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc()
      : super(UserProfileState(
    userProfile: null,
    isLoading: false,
    walletBalance: null,
  )) {
    on<FetchUserProfileEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await getUserData(onSuccess: (data) {
        final Map<String, String> userData = {};
        data.forEach((key, value) {
          if (value.runtimeType == String) {
            userData[key] = value;
          }
        });
        emit(state.copyWith(
          userProfile: userData,
          isLoading: false,
        ));
      });
    });

    on<SetUserProfileWalletBalanceEvent>((event, emit) async {
      emit(state.copyWith(walletBalance: event.walletBalance));
    });
  }

  Future<void> getUserData({
    required Function(Map<String, dynamic>) onSuccess,
  }) async {
    await Dio()
        .get('https://jsonplaceholder.typicode.com/users/1')
        .then((response) {
      onSuccess(response.data);
    });
  }
}
