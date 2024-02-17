// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:http/http.dart';

export 'package:http/http.dart' show BaseRequest, StreamedResponse;

abstract base class ProxyClient with BaseClient {
  const ProxyClient({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  Client get __inner => _inner ?? Client();

  @override
  Future<StreamedResponse> send(BaseRequest request) =>
    __inner.send(request);
}
