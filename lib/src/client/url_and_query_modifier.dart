// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:http/http.dart';

import '../shareable/http/proxy_client.dart';
import 'exception.dart';

final class _BasedUrlRequest implements BaseRequest {
  const _BasedUrlRequest._({
    required this.inner,
    required this.url,
  });

  factory _BasedUrlRequest.fromRequest({
    required BaseRequest request,
    required String baseUrl,
  }) {
    if (request.url.hasScheme) {
      throw RequestHasSchemaException();
    }

    return _BasedUrlRequest._(
      inner: request,
      url: Uri.parse('$baseUrl/${request.url}'),
    );
  }

  final BaseRequest inner;

  @override
  String get method => inner.method;

  @override
  final Uri url;

  @override
  int? get contentLength => inner.contentLength;

  @override
  set contentLength(int? value) => inner.contentLength = value;

  @override
  bool get persistentConnection => inner.persistentConnection;

  @override
  set persistentConnection(bool value) => inner.persistentConnection = value;

  @override
  bool get followRedirects => inner.followRedirects;

  @override
  set followRedirects(bool value) => inner.followRedirects = value;

  @override
  int get maxRedirects => inner.maxRedirects;

  @override
  set maxRedirects(int value) => inner.maxRedirects = value;

  @override
  Map<String, String> get headers => inner.headers;

  @override
  bool get finalized => inner.finalized;

  @override
  ByteStream finalize() => inner.finalize();

  @override
  Future<StreamedResponse> send() =>
    throw Exception(UnsupportedSendMethodException());
}

final class _QueriedUrlRequest implements BaseRequest {
  const _QueriedUrlRequest._({
    required this.inner,
    required this.url,
  });

  factory _QueriedUrlRequest.fromRequest(
    BaseRequest request, {
    Map<String, String>? queries,
  }) {
    final newQueries = <String, String>{
      ...request.url.queryParameters,
      if (queries != null)
      ...queries,
    };

    return _QueriedUrlRequest._(
      inner: request,
      url: Uri.parse(
        '${request.url.scheme}://${request.url.host}${request.url.path}?'
        '${newQueries.entries.map((e) => '${e.key}=${e.value}').join('&')}',
      ),
    );
  }

  final BaseRequest inner;

  @override
  String get method => inner.method;

  @override
  final Uri url;

  @override
  int? get contentLength => inner.contentLength;

  @override
  set contentLength(int? value) => inner.contentLength = value;

  @override
  bool get persistentConnection => inner.persistentConnection;

  @override
  set persistentConnection(bool value) => inner.persistentConnection = value;

  @override
  bool get followRedirects => inner.followRedirects;

  @override
  set followRedirects(bool value) => inner.followRedirects = value;

  @override
  int get maxRedirects => inner.maxRedirects;

  @override
  set maxRedirects(int value) => inner.maxRedirects = value;

  @override
  Map<String, String> get headers => inner.headers;

  @override
  bool get finalized => inner.finalized;

  @override
  ByteStream finalize() => inner.finalize();

  @override
  Future<StreamedResponse> send() =>
    throw Exception(UnsupportedSendMethodException());
}

base mixin UrlAndQueryModifier on ProxyClient {
  String get baseUrl;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (!request.url.hasScheme) {
      request = _BasedUrlRequest.fromRequest(request: request, baseUrl: baseUrl);
      request = _QueriedUrlRequest.fromRequest(request);
    }
    print(request.url);

    return super.send(request);
  }
}
