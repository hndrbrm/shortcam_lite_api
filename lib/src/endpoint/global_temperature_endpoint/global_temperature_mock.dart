// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'global_temperature_library.dart';

final class _GlobalTemperatureSuccessMock extends _GlobalTemperatureHttp {
  _GlobalTemperatureSuccessMock({
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
		"max":	{
			"value":	29.450006,
			"x":	0,
			"y":	475
		},
		"min":	{
			"value":	20.450006,
			"x":	307,
			"y":	220
		},
		"center":	{
			"value":	20.650005
		},
		"avg":	{
			"value":	22.850006
		}
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

final class _GlobalTemperatureFailedMock extends _GlobalTemperatureHttp {
  _GlobalTemperatureFailedMock({
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
