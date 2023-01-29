// holds data for a crypto asset
class CryptoAsset {
  final String name;
  final String symbol;
  final int rank;
  final double marketCapUsd;
  final double volumeUsd24Hr;
  final double changePercent24Hr;

  const CryptoAsset(this.name, this.symbol, this.rank, this.marketCapUsd,
      this.volumeUsd24Hr, this.changePercent24Hr);
}
