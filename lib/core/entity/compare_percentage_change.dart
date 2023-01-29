import 'crypto_percentage_change.dart';

// It is a holder entity for comparing two crypto assets by their daily changes
// in percentage
class CompareCryptoPercentageChange {
  final List<CryptoPercentageChange> first;
  final List<CryptoPercentageChange> second;

  const CompareCryptoPercentageChange(this.first, this.second);
}
