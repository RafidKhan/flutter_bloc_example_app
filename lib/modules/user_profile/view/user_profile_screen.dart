import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_app/modules/user_profile/event/user_profile_event.dart';
import 'package:flutter_bloc_example_app/utils/app_routes.dart';
import 'package:flutter_bloc_example_app/utils/navigation.dart';
import '../bloc/user_profile_bloc.dart';
import '../state/user_profile_state.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<UserProfileBloc>();
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("User Profile"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigation.push(
                context,
                AppRoutes.editProfileScreen,
                arguments: state.walletBalance,
              ).then((result) async {
                print("result: $result");
                if (result != null) {
                  controller.add(
                    SetUserProfileWalletBalanceEvent(
                      walletBalance: result.toString(),
                    ),
                  );
                }
              });
            },
            child: Text(
              state.walletBalance ?? "No Data",
            ),
          ),
          body: Center(
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.userProfile != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.userProfile!.length,
                          (index) {
                            final key =
                                state.userProfile!.keys.elementAt(index);
                            final value = state.userProfile![key];
                            return Text('$key: $value',
                                style: const TextStyle(fontSize: 18));
                          },
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          context
                              .read<UserProfileBloc>()
                              .add(FetchUserProfileEvent());
                        },
                        child: const Text('Fetch User Profile'),
                      ),
          ),
        );
      },
    );
  }
}
