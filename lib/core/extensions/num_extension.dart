extension NumExtension on num? {
  /// Dado un numero, retorna un string en formato moneda
  String toCurrency({bool decimals = false, bool symbol = true}) {
    if (this == null) {
      return '--';
    }

    final List<String> parts = toString().split('.');
    final RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

    parts[0] = parts.first.replaceAll(re, '.');
    if (decimals) {
      if (parts.length == 1) {
        parts.add('00');
      } else {
        parts[1] = parts[1].padRight(2, '0').substring(0, 2);
      }

      return !symbol ? parts.join(',') : '\$${parts.join(',')}';
    }
    return !symbol ? parts.join(',') : '\$${parts.first}';
  }
}
