// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_temperature_span_library.dart';

final class _GetTemperatureSpanSuccessMock extends _GetTemperatureSpanHttp {
  _GetTemperatureSpanSuccessMock({
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
	"data":	{
		"enable":	false,
		"hightemp":	100,
		"lowtemp":	0
	},
	"code":	200,
	"msg":	"Success"
}'''.codeUnits,
          200,
        ),
      ),
    ),
  );
}

final class _GetTemperatureSpanFailedMock extends _GetTemperatureSpanHttp {
  _GetTemperatureSpanFailedMock({
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
