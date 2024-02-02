import '../repository/account_information_repository.dart';

abstract class AccountInformationUseCase {
  final AccountInformationRepository accountInformationRepository;

  AccountInformationUseCase(this.accountInformationRepository);
}
