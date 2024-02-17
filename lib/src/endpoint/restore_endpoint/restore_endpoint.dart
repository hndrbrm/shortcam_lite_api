// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'restore_library.dart';

abstract interface class RestoreEndpoint {
  factory RestoreEndpoint({
    Client? inner,
  }) = _RestoreHttp;

  factory RestoreEndpoint.http({
    Client? inner,
  }) = _RestoreHttp;

  factory RestoreEndpoint.successMock({
    Client? inner,
  }) = _RestoreSuccessMock;

  factory RestoreEndpoint.failedMock({
    Client? inner,
  }) = _RestoreFailedMock;

  Future<void> fetch();
}
