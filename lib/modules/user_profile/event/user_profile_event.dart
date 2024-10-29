abstract class UserProfileEvent {}

class FetchUserProfileEvent extends UserProfileEvent {}

class SetUserProfileWalletBalanceEvent extends UserProfileEvent {
  String walletBalance;

  SetUserProfileWalletBalanceEvent({
    required this.walletBalance,
  });
}
