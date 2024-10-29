class UserProfileState {
  final bool isLoading;
  final Map<String, String>? userProfile;
  final String? walletBalance;

  UserProfileState({
    required this.isLoading,
    required this.userProfile,
    required this.walletBalance,
  });

  UserProfileState copyWith({
    bool? isLoading,
    Map<String, String>? userProfile,
    String? walletBalance,
  }) {
    return UserProfileState(
      isLoading: isLoading ?? this.isLoading,
      userProfile: userProfile ?? this.userProfile,
      walletBalance: walletBalance ?? this.walletBalance,
    );
  }
}
