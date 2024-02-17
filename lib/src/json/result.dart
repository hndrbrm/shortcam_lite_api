// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';

@immutable
abstract base class _Fields<T extends ToJson> with ToJson, JsonToString {
  const _Fields({
    required this.code,
    required this.message,
    this.data,
  });

  final int code;
  final String message;
  final T? data;
}

final class Result<T extends ToJson> extends _Fields<T> with _Equality<T>, _ToJson<T> {
  const Result({
    required super.code,
    required super.message,
    super.data,
  });

  Result.fromJson(Map<String, dynamic> json, T? Function(Map<String, dynamic>)? dataParser)
  : super(
    code: IntParser.parse(json['code']),
    message: StringParser.parse(json['msg']),
    data: json['data'] == null ? null : dataParser!.call(json['data']),
  );
}

base mixin _Equality<T extends ToJson> on _Fields<T> {
  @override
  bool operator ==(Object other) =>
    other is Result &&
    other.code == code &&
    other.message == message &&
    other.data == data;

  @override
  int get hashCode => Object.hash(
    code,
    message,
    data,
  );
}

base mixin _ToJson<T extends ToJson> on _Fields<T> {
  @override
  Map<String, dynamic> toJson() => {
    'code': code,
    'msg': message,
    if (data != null)
    'data': data!.toJson(),
  };
}
