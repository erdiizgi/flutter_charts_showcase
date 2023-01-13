class CryptoAsset {
  final String name;
  final int rank;
  final double marketCapUsd;
  final double volumeUsd24Hr;
  final double changePercent24Hr;

  CryptoAsset(this.name, this.rank, this.marketCapUsd, this.volumeUsd24Hr,
      this.changePercent24Hr);
}
