// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_leakage_library.dart';

abstract interface class GetLeakageEndpoint {
  factory GetLeakageEndpoint({
    Client? inner,
  }) = _GetLeakageHttp;

  factory GetLeakageEndpoint.http({
    Client? inner,
  }) = _GetLeakageHttp;

  factory GetLeakageEndpoint.successMock({
    Client? inner,
  }) = _GetLeakageSuccessMock;

  factory GetLeakageEndpoint.failedMock({
    Client? inner,
  }) = _GetLeakageFailedMock;

  Future<Leakage> fetch();
}
