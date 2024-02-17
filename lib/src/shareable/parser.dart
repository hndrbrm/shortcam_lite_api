// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

class IntParser {
  const IntParser._();

  static int? tryParse(Object? object) {
    if (object is int) {
      return object;
    }

    if (object is String) {
      return int.tryParse(object);
    }

    if (object is double) {
      return object.toInt();
    }

    if (object is bool) {
      return object ? 1 : 0;
    }

    return null;
  }

  static int parse(Object object) {
    final result = tryParse(object);
    if (result != null) {
      return result;
    }

    throw const InvalidIntException();
  }
}

class InvalidIntException implements Exception {
  const InvalidIntException();
}

class DoubleParser {
  const DoubleParser._();

  static double? tryParse(Object? object) {
    if (object is double) {
      return object;
    }

    if (object is String) {
      return double.parse(object);
    }

    if (object is int) {
      return object.toDouble();
    }

    if (object is bool) {
      return object ? 1.0 : 0.0;
    }

    return null;
  }

  static double parse(Object object) {
    final result = tryParse(object);
    if (result != null) {
      return result;
    }

    throw const InvalidDoubleException();
  }
}

class InvalidDoubleException implements Exception {
  const InvalidDoubleException();
}

class StringParser {
  const StringParser._();

  static String? tryParse(Object? object) {
    if (object is String) {
      return object;
    }

    if (object is num) {
      return object.toString();
    }

    if (object is bool) {
      return object.toString();
    }

    return null;
  }

  static String parse(Object object) {
    final result = tryParse(object);
    if (result != null) {
      return result;
    }

    throw const InvalidStringException();
  }
}

class InvalidStringException implements Exception {
  const InvalidStringException();
}

class BoolParser {
  const BoolParser._();

  static bool? tryParse(Object? object) {
    if (object is bool) {
      return object;
    }

    if (object is String) {
      final normalized = object.trim().toLowerCase();

      if (['true', 'y'].contains(normalized)) {
        return true;
      }

      if (['false', 'n'].contains(normalized)) {
        return false;
      }
    }

    if (object is num) {
      return object > 0;
    }

    return null;
  }

  static bool parse(Object object) {
    final result = tryParse(object);
    if (result != null) {
      return result;
    }

    throw InvalidBoolException(object);
  }
}

class InvalidBoolException implements Exception {
  const InvalidBoolException(this.object);

  final Object? object;

  @override
  String toString() => 'Object "${object.runtimeType}($object)" is not a valid Bool Object.';
}

class DateTimeParser {
  const DateTimeParser._();

  static DateTime? tryParse(Object? object) {
    if (object is DateTime) {
      return object;
    }

    if (object is String) {
      return DateTime.parse(object);
    }

    if (object is int) {
      return DateTime.fromMillisecondsSinceEpoch(object);
    }

    return null;
  }

  static DateTime parse(Object object) {
    final result = tryParse(object);
    if (result != null) {
      return result;
    }

    throw const InvalidDateTimeException();
  }
}

class InvalidDateTimeException implements Exception {
  const InvalidDateTimeException();
}
