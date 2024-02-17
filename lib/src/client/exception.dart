// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

final class RequestHasSchemaException implements Exception {}

final class UnsupportedSendMethodException implements Exception {}

final class ErrorResponseException implements Exception {
  const ErrorResponseException({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  @override
  String toString() => 'Error($code): $message';
}
