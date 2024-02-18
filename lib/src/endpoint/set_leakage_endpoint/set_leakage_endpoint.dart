// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_leakage_library.dart';

abstract interface class SetLeakageEndpoint {
  factory SetLeakageEndpoint({
    Client? inner,
  }) = _SetLeakageHttp;

  factory SetLeakageEndpoint.http({
    Client? inner,
  }) = _SetLeakageHttp;

  factory SetLeakageEndpoint.successMock({
    Client? inner,
  }) = _SetLeakageSuccessMock;

  factory SetLeakageEndpoint.failedMock({
    Client? inner,
  }) = _SetLeakageFailedMock;

  Future<void> fetch(Leakage leakage);
}
