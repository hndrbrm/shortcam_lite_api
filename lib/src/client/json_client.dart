// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import '../config.dart';
import '../shareable/http/proxy_client.dart';
import 'url_and_query_modifier.dart';

base class JsonClient extends ProxyClient with UrlAndQueryModifier {
  const JsonClient({
    super.inner,
  });

  static String _baseUrl = Config.baseUrlWifi;

  @override
  String get baseUrl => _baseUrl;

  void _nextBaseUrl() => _baseUrl = _baseUrl == Config.baseUrlWifi
    ? Config.baseUrlRndis
    : Config.baseUrlWifi;

  Future<dynamic> _doubleCall(Future<dynamic> Function() internal) async {
    try {
      return await internal();
    } catch (exception) {
      _nextBaseUrl();
      return await internal();
    }
  }

  Future<dynamic> getJson(Uri url, { Map<String, String>? headers }) async {
    Future<dynamic> internal() async {
      final response = await get(url, headers: headers);
      return jsonDecode(response.body);
    }

    return _doubleCall(internal);
  }

  Future<dynamic> postJson(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Encoding? encoding,
  }) async {
    Future<dynamic> internal() async {
      final response = await post(
        url,
        headers: {
          if (headers != null)
          ...headers,
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: body == null ? null : jsonEncode(body),
        encoding: encoding,
      );

      return jsonDecode(response.body);
    }

    return _doubleCall(internal);
  }
}
