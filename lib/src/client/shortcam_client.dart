// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../config.dart';
import '../json/result.dart';
import '../shareable/json_mixin.dart';
import 'exception.dart';
import 'json_client.dart';

base class ShortcamClient<T extends ToJson> {
  const ShortcamClient({
    Client? inner,
    T? Function(Map<String, dynamic>)? dataParser,
  })
  : _inner = inner,
    _dataParser = dataParser;

  final Client? _inner;
  final T? Function(Map<String, dynamic>)? _dataParser;

  static String _baseUrl = Config.baseUrlWifi;

  void _nextBaseUrl() => _baseUrl = _baseUrl == Config.baseUrlWifi
    ? Config.baseUrlRndis
    : Config.baseUrlWifi;

  Future<T?> _doubleCall(Future<Map<String, dynamic>> Function() internal) async {
    Future<T?> process() async {
      final json = await internal();
      final result = Result<T>.fromJson(json, _dataParser);
      if (result.code == 200) {
        return result.data;
      }
      throw ErrorResponseException(code: result.code, message: result.message);
    }

    try {
      return await process();
    } catch (exception) {
      _nextBaseUrl();
      return await process();
    }
  }

  Future<T?> getJson(Uri url, { Map<String, String>? headers }) async {
    Future<Map<String, dynamic>> internal() async {
      final jsonClient = JsonClient(inner: _inner, baseUrl: _baseUrl);
      return await jsonClient.getJson(url, headers: headers);
    }
    return _doubleCall(internal);
  }

  Future<T?> postJson(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Encoding? encoding,
  }) async {
    Future<Map<String, dynamic>> internal() async {
      final jsonClient = JsonClient(inner: _inner, baseUrl: _baseUrl);
      return await jsonClient
        .postJson(
          url,
          headers: headers,
          body: body,
          encoding: encoding,
        );
    }
    return _doubleCall(internal);
  }
}
