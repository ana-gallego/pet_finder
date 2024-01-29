extension StringExtension on String? {
  String capitalize() {
    if (this == null || this == '') {
      return '--';
    }

    /// Se pasa todo el texto a minusculas y convierte en una lista de strings
    final List<String> capitalizedText = this!.toLowerCase().split('');

    /// pattern de caracteres, con estos se valida que letra se volverá mayúscula
    final RegExp regex = RegExp('^[!¿¡?.;]');

    for (var i = 0; i < capitalizedText.length; i++) {
      /// La posición 0 siempre irá en mayuscula
      capitalizedText[0] = capitalizedText.first.toUpperCase();

      /// Se pregunta por empieza por la posicion 2 porque se validarán
      ///  las 2 posiciones casillas del texto
      if (i > 1) {
        /// Si la posición anterion es un caracter, la actual se volverá mayuscula
        if (regex.hasMatch(this![(i - 1)])) {
          capitalizedText[i] = capitalizedText[i].toUpperCase();

          /// si la anterior es un espacio se validará la posicion anterior a esta
        } else if (this![(i - 1)] == ' ') {
          if (regex.hasMatch(this![(i - 2)])) {
            capitalizedText[i] = capitalizedText[i].toUpperCase();
          }
        }
      } else {}
    }

    /// se vuelve el array de string un string
    return capitalizedText.join();
  }

  String initials({int lenght = 2}) {
    if (this == null || this == '') {
      return '--';
    }
    List<String> names = [];

    for (final char in ['_', ' - ', ' ']) {
      if (this!.contains(char)) {
        names = this!.toUpperCase().split(char);
      }
    }
    if (names.length > 1) {
      return names
          .map((e) => e.isNotEmpty ? e[0] : '')
          .take(lenght)
          .join()
          .toUpperCase();
    }

    return this!.substring(0, lenght).toUpperCase();
  }

  String? trySubstring(int start, [int? end]) {
    if (this == null || this == '') {
      return this;
    }

    final end0 = end ?? this!.length;

    return this!.length > end0
        ? this!.substring(start, end0)
        : this!.substring(start, this!.length);
  }

  Uri toUri() {
    if (this == null || this == '') return Uri.parse('--');
    return Uri.parse(this!);
  }
}
