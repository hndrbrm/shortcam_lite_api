// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_gain_library.dart';

final class _SetGainSuccessMock extends _SetGainHttp {
  _SetGainSuccessMock({
    Client? inner,
  })
  : super(
    inner: MockedClient(
      responseMocker: () async => Future.delayed(
        const Duration(seconds: 3),
      ).then(
        (_) => Response.bytes(
// Use string representation to reduce IDE analyze script.
'''{
	"code":	200,
	"msg":	"Success"
}'''.codeUnits,
          200,
        ),
      ),
    ),
  );
}

final class _SetGainFailedMock extends _SetGainHttp {
  _SetGainFailedMock({
    Client? inner,
  })
  : super(
    inner: MockedClient(
      responseMocker: () async => Future.delayed(
        const Duration(seconds: 3),
      ).then((_) => throw UnimplementedError()),
    ),
  );
}
