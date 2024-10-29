import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_app/modules/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:flutter_bloc_example_app/modules/edit_profile/state/edit_profile_state.dart';
import 'package:flutter_bloc_example_app/utils/navigation.dart';

class EditProfileScreen extends StatefulWidget {
  final String? defaultValue;

  const EditProfileScreen({
    super.key,
    required this.defaultValue,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      if (widget.defaultValue != null) {
        context.read<EditProfileBloc>().setDefaultValue(widget.defaultValue!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            Navigation.pop(
              context,
              state.walletBalance.text.trim(),
            );
          },
          child: const Icon(Icons.arrow_back),
        );
      }),
      body: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: state.walletBalance,
              decoration: const InputDecoration(labelText: "Wallet Balance"),
            ),
          ),
        );
      }),
    );
  }
}
