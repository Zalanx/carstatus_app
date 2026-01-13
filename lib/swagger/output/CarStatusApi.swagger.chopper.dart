// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CarStatusApi.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CarStatusApi extends CarStatusApi {
  _$CarStatusApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CarStatusApi;

  @override
  Future<Response<List<TicketDto>>> _apiCarStatusGetAllTicketsGet() {
    final Uri $url = Uri.parse('/api/CarStatus/GetAllTickets');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<List<TicketDto>, TicketDto>($request);
  }

  @override
  Future<Response<TicketDto>> _apiCarStatusGetTicketByIdGet({
    String? ticketId,
  }) {
    final Uri $url = Uri.parse('/api/CarStatus/GetTicketById');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ticketId': ticketId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<TicketDto, TicketDto>($request);
  }

  @override
  Future<Response<TicketDto>> _apiCarStatusCreateTicketPost({
    required CreateTicketDto? body,
  }) {
    final Uri $url = Uri.parse('/api/CarStatus/CreateTicket');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TicketDto, TicketDto>($request);
  }

  @override
  Future<Response<DbUser>> _apiCarStatusLoginUserPost({
    required UserDto? body,
  }) {
    final Uri $url = Uri.parse('/api/CarStatus/LoginUser');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<DbUser, DbUser>($request);
  }

  @override
  Future<Response<dynamic>> _apiCarStatusRegisterUserPost({
    required UserDto? body,
  }) {
    final Uri $url = Uri.parse('/api/CarStatus/RegisterUser');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TicketDto>> _apiCarStatusUpdateTicketPatch({
    String? ticketnumber,
    String? newCarStatus,
  }) {
    final Uri $url = Uri.parse('/api/CarStatus/UpdateTicket');
    final Map<String, dynamic> $params = <String, dynamic>{
      'ticketnumber': ticketnumber,
      'newCarStatus': newCarStatus,
    };
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<TicketDto, TicketDto>($request);
  }
}
