// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';

import '../shareable/future_or_extension.dart';

final class MockedClient implements Client {
  const MockedClient({
    required FutureOr<Response> Function() responseMocker,
  })
  : _responseMocker = responseMocker;

  final FutureOr<Response> Function() _responseMocker;

  @override
  void close() {}

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async => _responseMocker();

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async =>
    _responseMocker();

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) async =>
    _responseMocker();

  @override
  Future<Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async => _responseMocker();

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async => _responseMocker();

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async => _responseMocker();

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) async =>
    _responseMocker().then((value) => value.body);

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) async =>
    _responseMocker().then((value) => value.bodyBytes);

  @override
  Future<StreamedResponse> send(BaseRequest request) async =>
    (await _responseMocker()).toStreamedResponse();
}

extension _ResponseExtension on Response {
  StreamedResponse toStreamedResponse() => StreamedResponse(
    Stream.fromIterable([ bodyBytes.toList() ]),
    statusCode,
    contentLength: contentLength,
    request: request,
    headers: headers,
    isRedirect: isRedirect,
    persistentConnection: persistentConnection,
    reasonPhrase: reasonPhrase,
  );
}
