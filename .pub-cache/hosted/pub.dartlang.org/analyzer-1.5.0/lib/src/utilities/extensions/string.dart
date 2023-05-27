// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

extension ListOfStringExtension on List<String> {
  /// Produce a comma-separated representation of this list, with the last
  /// element preceded by 'and' when there are more than two elements in this
  /// list.
  String get commaSeparatedWithAnd => _commaSeparated('and');

  /// Produce a comma-separated representation of this list, with the last
  /// element preceded by 'or' when there are more than two elements in this
  /// list.
  String get commaSeparatedWithOr => _commaSeparated('or');

  /// Produce a comma-separated representation of this list, with the last
  /// element preceded by 'and' when there are more than two elements in this
  /// list, and a pair of single quotes surrounding each element.
  String get quotedAndCommaSeparatedWithAnd =>
      _commaSeparated('and', quoted: true);

  /// Produce a comma-separated representation of this list, with the last
  /// element preceded by the [conjunction] when there are more than two
  /// elements in this list.
  ///
  /// Each element is surrounded by a pair of single quotes if [quoted] is true.
  String _commaSeparated(String conjunction, {bool quoted = false}) {
    if (length == 0) {
      return '';
    } else if (length == 1) {
      return quoted ? "'${this[0]}'" : this[0];
    } else if (length == 2) {
      return quoted
          ? "'${this[0]}' $conjunction '${this[1]}'"
          : '${this[0]} $conjunction ${this[1]}';
    } else {
      var buffer = StringBuffer();
      for (int i = 0; i < length - 1; i++) {
        if (quoted) {
          buffer.write("'");
        }
        buffer.write(this[i]);
        if (quoted) {
          buffer.write("'");
        }
        buffer.write(', ');
      }
      buffer.write(conjunction);
      buffer.write(' ');
      if (quoted) {
        buffer.write("'");
      }
      buffer.write(this[length - 1]);
      if (quoted) {
        buffer.write("'");
      }
      return buffer.toString();
    }
  }
}
