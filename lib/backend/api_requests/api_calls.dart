import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PinLocationCall {
  static Future<ApiCallResponse> call({
    String? longitude = '',
    String? latitude = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "longitude": "${longitude}",
  "latitude": "${latitude}",
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pinLocation',
      apiUrl:
          'https://us-central1-eyal-9b5f3.cloudfunctions.net/app/pinLocation',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeliveryCashCollectionCall {
  static Future<ApiCallResponse> call({
    String? deliveryAgentId = '',
    String? userId = '',
    double? amount,
    String? customerName = '',
    String? shopName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "deliveryAgentId": "${deliveryAgentId}",
  "userId": "${userId}",
  "amount": ${amount},
  "customerName": "${customerName}",
  "shopName": "${shopName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deliveryCashCollection',
      apiUrl:
          'https://us-central1-eyal-9b5f3.cloudfunctions.net/app/deliveryCashCollection',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
