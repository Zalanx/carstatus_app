// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'CarStatusApi.enums.swagger.dart' as enums;
export 'CarStatusApi.enums.swagger.dart';

part 'CarStatusApi.swagger.chopper.dart';
part 'CarStatusApi.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class CarStatusApi extends ChopperService {
  static CarStatusApi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$CarStatusApi(client);
    }

    final newClient = ChopperClient(
      services: [_$CarStatusApi()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http://10.0.2.2:5276'),
    );
    return _$CarStatusApi(newClient);
  }

  ///
  Future<chopper.Response<List<TicketDto>>> apiCarStatusGetAllTicketsGet() {
    generatedMapping.putIfAbsent(TicketDto, () => TicketDto.fromJsonFactory);

    return _apiCarStatusGetAllTicketsGet();
  }

  ///
  @GET(path: '/api/CarStatus/GetAllTickets')
  Future<chopper.Response<List<TicketDto>>> _apiCarStatusGetAllTicketsGet();

  ///
  ///@param ticketId
  Future<chopper.Response<TicketDto>> apiCarStatusGetTicketByIdGet({
    String? ticketId,
  }) {
    generatedMapping.putIfAbsent(TicketDto, () => TicketDto.fromJsonFactory);

    return _apiCarStatusGetTicketByIdGet(ticketId: ticketId);
  }

  ///
  ///@param ticketId
  @GET(path: '/api/CarStatus/GetTicketById')
  Future<chopper.Response<TicketDto>> _apiCarStatusGetTicketByIdGet({
    @Query('ticketId') String? ticketId,
  });

  ///
  ///@param userId
  Future<chopper.Response<List<TicketDto>>>
  apiCarStatusGetTicketsForUserByIdGet({int? userId}) {
    generatedMapping.putIfAbsent(TicketDto, () => TicketDto.fromJsonFactory);

    return _apiCarStatusGetTicketsForUserByIdGet(userId: userId);
  }

  ///
  ///@param userId
  @GET(path: '/api/CarStatus/GetTicketsForUserById')
  Future<chopper.Response<List<TicketDto>>>
  _apiCarStatusGetTicketsForUserByIdGet({@Query('userId') int? userId});

  ///
  ///@param username
  Future<chopper.Response<int>> apiCarStatusGetUserIdByUsernameGet({
    String? username,
  }) {
    return _apiCarStatusGetUserIdByUsernameGet(username: username);
  }

  ///
  ///@param username
  @GET(path: '/api/CarStatus/GetUserIdByUsername')
  Future<chopper.Response<int>> _apiCarStatusGetUserIdByUsernameGet({
    @Query('username') String? username,
  });

  ///
  Future<chopper.Response<TicketDto>> apiCarStatusCreateTicketPost({
    required CreateTicketDto? body,
  }) {
    generatedMapping.putIfAbsent(TicketDto, () => TicketDto.fromJsonFactory);

    return _apiCarStatusCreateTicketPost(body: body);
  }

  ///
  @POST(path: '/api/CarStatus/CreateTicket', optionalBody: true)
  Future<chopper.Response<TicketDto>> _apiCarStatusCreateTicketPost({
    @Body() required CreateTicketDto? body,
  });

  ///
  Future<chopper.Response<DbUser>> apiCarStatusLoginUserPost({
    required UserDto? body,
  }) {
    generatedMapping.putIfAbsent(DbUser, () => DbUser.fromJsonFactory);

    return _apiCarStatusLoginUserPost(body: body);
  }

  ///
  @POST(path: '/api/CarStatus/LoginUser', optionalBody: true)
  Future<chopper.Response<DbUser>> _apiCarStatusLoginUserPost({
    @Body() required UserDto? body,
  });

  ///
  Future<chopper.Response> apiCarStatusRegisterUserPost({
    required UserDto? body,
  }) {
    return _apiCarStatusRegisterUserPost(body: body);
  }

  ///
  @POST(path: '/api/CarStatus/RegisterUser', optionalBody: true)
  Future<chopper.Response> _apiCarStatusRegisterUserPost({
    @Body() required UserDto? body,
  });

  ///
  ///@param ticketnumber
  ///@param newCarStatus
  ///@param car
  ///@param customerName
  Future<chopper.Response<TicketDto>> apiCarStatusUpdateTicketPatch({
    String? ticketnumber,
    enums.CarStatusEnum? newCarStatus,
    String? car,
    String? customerName,
    required List<ToDoDto>? body,
  }) {
    generatedMapping.putIfAbsent(TicketDto, () => TicketDto.fromJsonFactory);

    return _apiCarStatusUpdateTicketPatch(
      ticketnumber: ticketnumber,
      newCarStatus: newCarStatus?.value?.toString(),
      car: car,
      customerName: customerName,
      body: body,
    );
  }

  ///
  ///@param ticketnumber
  ///@param newCarStatus
  ///@param car
  ///@param customerName
  @PATCH(path: '/api/CarStatus/UpdateTicket', optionalBody: true)
  Future<chopper.Response<TicketDto>> _apiCarStatusUpdateTicketPatch({
    @Query('ticketnumber') String? ticketnumber,
    @Query('newCarStatus') String? newCarStatus,
    @Query('car') String? car,
    @Query('customerName') String? customerName,
    @Body() required List<ToDoDto>? body,
  });
}

@JsonSerializable(explicitToJson: true)
class CreateTicketDto {
  const CreateTicketDto({
    required this.userId,
    this.customerName,
    this.car,
    this.carStatus,
    this.toDos,
  });

  factory CreateTicketDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketDtoFromJson(json);

  static const toJsonFactory = _$CreateTicketDtoToJson;
  Map<String, dynamic> toJson() => _$CreateTicketDtoToJson(this);

  @JsonKey(name: 'userId')
  final int userId;
  @JsonKey(name: 'customerName')
  final String? customerName;
  @JsonKey(name: 'car')
  final String? car;
  @JsonKey(
    name: 'carStatus',
    toJson: carStatusEnumNullableToJson,
    fromJson: carStatusEnumNullableFromJson,
  )
  final enums.CarStatusEnum? carStatus;
  @JsonKey(name: 'toDos', defaultValue: <ToDoDto>[])
  final List<ToDoDto>? toDos;
  static const fromJsonFactory = _$CreateTicketDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateTicketDto &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.customerName, customerName) ||
                const DeepCollectionEquality().equals(
                  other.customerName,
                  customerName,
                )) &&
            (identical(other.car, car) ||
                const DeepCollectionEquality().equals(other.car, car)) &&
            (identical(other.carStatus, carStatus) ||
                const DeepCollectionEquality().equals(
                  other.carStatus,
                  carStatus,
                )) &&
            (identical(other.toDos, toDos) ||
                const DeepCollectionEquality().equals(other.toDos, toDos)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(customerName) ^
      const DeepCollectionEquality().hash(car) ^
      const DeepCollectionEquality().hash(carStatus) ^
      const DeepCollectionEquality().hash(toDos) ^
      runtimeType.hashCode;
}

extension $CreateTicketDtoExtension on CreateTicketDto {
  CreateTicketDto copyWith({
    int? userId,
    String? customerName,
    String? car,
    enums.CarStatusEnum? carStatus,
    List<ToDoDto>? toDos,
  }) {
    return CreateTicketDto(
      userId: userId ?? this.userId,
      customerName: customerName ?? this.customerName,
      car: car ?? this.car,
      carStatus: carStatus ?? this.carStatus,
      toDos: toDos ?? this.toDos,
    );
  }

  CreateTicketDto copyWithWrapped({
    Wrapped<int>? userId,
    Wrapped<String?>? customerName,
    Wrapped<String?>? car,
    Wrapped<enums.CarStatusEnum?>? carStatus,
    Wrapped<List<ToDoDto>?>? toDos,
  }) {
    return CreateTicketDto(
      userId: (userId != null ? userId.value : this.userId),
      customerName: (customerName != null
          ? customerName.value
          : this.customerName),
      car: (car != null ? car.value : this.car),
      carStatus: (carStatus != null ? carStatus.value : this.carStatus),
      toDos: (toDos != null ? toDos.value : this.toDos),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class DbTicket {
  const DbTicket({
    required this.id,
    this.ticketnumber,
    this.userId,
    required this.customerName,
    required this.car,
    required this.carStatus,
    this.toDos,
    this.user,
  });

  factory DbTicket.fromJson(Map<String, dynamic> json) =>
      _$DbTicketFromJson(json);

  static const toJsonFactory = _$DbTicketToJson;
  Map<String, dynamic> toJson() => _$DbTicketToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'ticketnumber')
  final String? ticketnumber;
  @JsonKey(name: 'userId')
  final int? userId;
  @JsonKey(name: 'customerName')
  final String customerName;
  @JsonKey(name: 'car')
  final String car;
  @JsonKey(
    name: 'carStatus',
    toJson: carStatusEnumToJson,
    fromJson: carStatusEnumFromJson,
  )
  final enums.CarStatusEnum carStatus;
  @JsonKey(name: 'toDos', defaultValue: <DbToDos>[])
  final List<DbToDos>? toDos;
  @JsonKey(name: 'user')
  final DbUser? user;
  static const fromJsonFactory = _$DbTicketFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DbTicket &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.ticketnumber, ticketnumber) ||
                const DeepCollectionEquality().equals(
                  other.ticketnumber,
                  ticketnumber,
                )) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.customerName, customerName) ||
                const DeepCollectionEquality().equals(
                  other.customerName,
                  customerName,
                )) &&
            (identical(other.car, car) ||
                const DeepCollectionEquality().equals(other.car, car)) &&
            (identical(other.carStatus, carStatus) ||
                const DeepCollectionEquality().equals(
                  other.carStatus,
                  carStatus,
                )) &&
            (identical(other.toDos, toDos) ||
                const DeepCollectionEquality().equals(other.toDos, toDos)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(ticketnumber) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(customerName) ^
      const DeepCollectionEquality().hash(car) ^
      const DeepCollectionEquality().hash(carStatus) ^
      const DeepCollectionEquality().hash(toDos) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $DbTicketExtension on DbTicket {
  DbTicket copyWith({
    int? id,
    String? ticketnumber,
    int? userId,
    String? customerName,
    String? car,
    enums.CarStatusEnum? carStatus,
    List<DbToDos>? toDos,
    DbUser? user,
  }) {
    return DbTicket(
      id: id ?? this.id,
      ticketnumber: ticketnumber ?? this.ticketnumber,
      userId: userId ?? this.userId,
      customerName: customerName ?? this.customerName,
      car: car ?? this.car,
      carStatus: carStatus ?? this.carStatus,
      toDos: toDos ?? this.toDos,
      user: user ?? this.user,
    );
  }

  DbTicket copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String?>? ticketnumber,
    Wrapped<int?>? userId,
    Wrapped<String>? customerName,
    Wrapped<String>? car,
    Wrapped<enums.CarStatusEnum>? carStatus,
    Wrapped<List<DbToDos>?>? toDos,
    Wrapped<DbUser?>? user,
  }) {
    return DbTicket(
      id: (id != null ? id.value : this.id),
      ticketnumber: (ticketnumber != null
          ? ticketnumber.value
          : this.ticketnumber),
      userId: (userId != null ? userId.value : this.userId),
      customerName: (customerName != null
          ? customerName.value
          : this.customerName),
      car: (car != null ? car.value : this.car),
      carStatus: (carStatus != null ? carStatus.value : this.carStatus),
      toDos: (toDos != null ? toDos.value : this.toDos),
      user: (user != null ? user.value : this.user),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class DbToDos {
  const DbToDos({
    required this.id,
    required this.todo,
    required this.done,
    this.dbTicketId,
    this.ticket,
  });

  factory DbToDos.fromJson(Map<String, dynamic> json) =>
      _$DbToDosFromJson(json);

  static const toJsonFactory = _$DbToDosToJson;
  Map<String, dynamic> toJson() => _$DbToDosToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'todo')
  final String todo;
  @JsonKey(name: 'done')
  final bool done;
  @JsonKey(name: 'dbTicketId')
  final int? dbTicketId;
  @JsonKey(name: 'ticket')
  final DbTicket? ticket;
  static const fromJsonFactory = _$DbToDosFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DbToDos &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.todo, todo) ||
                const DeepCollectionEquality().equals(other.todo, todo)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)) &&
            (identical(other.dbTicketId, dbTicketId) ||
                const DeepCollectionEquality().equals(
                  other.dbTicketId,
                  dbTicketId,
                )) &&
            (identical(other.ticket, ticket) ||
                const DeepCollectionEquality().equals(other.ticket, ticket)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(todo) ^
      const DeepCollectionEquality().hash(done) ^
      const DeepCollectionEquality().hash(dbTicketId) ^
      const DeepCollectionEquality().hash(ticket) ^
      runtimeType.hashCode;
}

extension $DbToDosExtension on DbToDos {
  DbToDos copyWith({
    int? id,
    String? todo,
    bool? done,
    int? dbTicketId,
    DbTicket? ticket,
  }) {
    return DbToDos(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      done: done ?? this.done,
      dbTicketId: dbTicketId ?? this.dbTicketId,
      ticket: ticket ?? this.ticket,
    );
  }

  DbToDos copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? todo,
    Wrapped<bool>? done,
    Wrapped<int?>? dbTicketId,
    Wrapped<DbTicket?>? ticket,
  }) {
    return DbToDos(
      id: (id != null ? id.value : this.id),
      todo: (todo != null ? todo.value : this.todo),
      done: (done != null ? done.value : this.done),
      dbTicketId: (dbTicketId != null ? dbTicketId.value : this.dbTicketId),
      ticket: (ticket != null ? ticket.value : this.ticket),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class DbUser {
  const DbUser({
    required this.id,
    required this.username,
    required this.password,
    required this.isAdmin,
    this.tickets,
  });

  factory DbUser.fromJson(Map<String, dynamic> json) => _$DbUserFromJson(json);

  static const toJsonFactory = _$DbUserToJson;
  Map<String, dynamic> toJson() => _$DbUserToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'isAdmin')
  final bool isAdmin;
  @JsonKey(name: 'tickets', defaultValue: <DbTicket>[])
  final List<DbTicket>? tickets;
  static const fromJsonFactory = _$DbUserFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DbUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(
                  other.isAdmin,
                  isAdmin,
                )) &&
            (identical(other.tickets, tickets) ||
                const DeepCollectionEquality().equals(other.tickets, tickets)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isAdmin) ^
      const DeepCollectionEquality().hash(tickets) ^
      runtimeType.hashCode;
}

extension $DbUserExtension on DbUser {
  DbUser copyWith({
    int? id,
    String? username,
    String? password,
    bool? isAdmin,
    List<DbTicket>? tickets,
  }) {
    return DbUser(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      isAdmin: isAdmin ?? this.isAdmin,
      tickets: tickets ?? this.tickets,
    );
  }

  DbUser copyWithWrapped({
    Wrapped<int>? id,
    Wrapped<String>? username,
    Wrapped<String>? password,
    Wrapped<bool>? isAdmin,
    Wrapped<List<DbTicket>?>? tickets,
  }) {
    return DbUser(
      id: (id != null ? id.value : this.id),
      username: (username != null ? username.value : this.username),
      password: (password != null ? password.value : this.password),
      isAdmin: (isAdmin != null ? isAdmin.value : this.isAdmin),
      tickets: (tickets != null ? tickets.value : this.tickets),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class TicketDto {
  const TicketDto({
    this.ticketnumber,
    this.userId,
    this.customerName,
    this.car,
    this.carStatus,
    this.toDos,
  });

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);

  static const toJsonFactory = _$TicketDtoToJson;
  Map<String, dynamic> toJson() => _$TicketDtoToJson(this);

  @JsonKey(name: 'ticketnumber')
  final String? ticketnumber;
  @JsonKey(name: 'userId')
  final int? userId;
  @JsonKey(name: 'customerName')
  final String? customerName;
  @JsonKey(name: 'car')
  final String? car;
  @JsonKey(
    name: 'carStatus',
    toJson: carStatusEnumNullableToJson,
    fromJson: carStatusEnumNullableFromJson,
  )
  final enums.CarStatusEnum? carStatus;
  @JsonKey(name: 'toDos', defaultValue: <ToDoDto>[])
  final List<ToDoDto>? toDos;
  static const fromJsonFactory = _$TicketDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TicketDto &&
            (identical(other.ticketnumber, ticketnumber) ||
                const DeepCollectionEquality().equals(
                  other.ticketnumber,
                  ticketnumber,
                )) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.customerName, customerName) ||
                const DeepCollectionEquality().equals(
                  other.customerName,
                  customerName,
                )) &&
            (identical(other.car, car) ||
                const DeepCollectionEquality().equals(other.car, car)) &&
            (identical(other.carStatus, carStatus) ||
                const DeepCollectionEquality().equals(
                  other.carStatus,
                  carStatus,
                )) &&
            (identical(other.toDos, toDos) ||
                const DeepCollectionEquality().equals(other.toDos, toDos)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ticketnumber) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(customerName) ^
      const DeepCollectionEquality().hash(car) ^
      const DeepCollectionEquality().hash(carStatus) ^
      const DeepCollectionEquality().hash(toDos) ^
      runtimeType.hashCode;
}

extension $TicketDtoExtension on TicketDto {
  TicketDto copyWith({
    String? ticketnumber,
    int? userId,
    String? customerName,
    String? car,
    enums.CarStatusEnum? carStatus,
    List<ToDoDto>? toDos,
  }) {
    return TicketDto(
      ticketnumber: ticketnumber ?? this.ticketnumber,
      userId: userId ?? this.userId,
      customerName: customerName ?? this.customerName,
      car: car ?? this.car,
      carStatus: carStatus ?? this.carStatus,
      toDos: toDos ?? this.toDos,
    );
  }

  TicketDto copyWithWrapped({
    Wrapped<String?>? ticketnumber,
    Wrapped<int?>? userId,
    Wrapped<String?>? customerName,
    Wrapped<String?>? car,
    Wrapped<enums.CarStatusEnum?>? carStatus,
    Wrapped<List<ToDoDto>?>? toDos,
  }) {
    return TicketDto(
      ticketnumber: (ticketnumber != null
          ? ticketnumber.value
          : this.ticketnumber),
      userId: (userId != null ? userId.value : this.userId),
      customerName: (customerName != null
          ? customerName.value
          : this.customerName),
      car: (car != null ? car.value : this.car),
      carStatus: (carStatus != null ? carStatus.value : this.carStatus),
      toDos: (toDos != null ? toDos.value : this.toDos),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ToDoDto {
  const ToDoDto({this.task, required this.done});

  factory ToDoDto.fromJson(Map<String, dynamic> json) =>
      _$ToDoDtoFromJson(json);

  static const toJsonFactory = _$ToDoDtoToJson;
  Map<String, dynamic> toJson() => _$ToDoDtoToJson(this);

  @JsonKey(name: 'task')
  final String? task;
  @JsonKey(name: 'done')
  final bool done;
  static const fromJsonFactory = _$ToDoDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ToDoDto &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(task) ^
      const DeepCollectionEquality().hash(done) ^
      runtimeType.hashCode;
}

extension $ToDoDtoExtension on ToDoDto {
  ToDoDto copyWith({String? task, bool? done}) {
    return ToDoDto(task: task ?? this.task, done: done ?? this.done);
  }

  ToDoDto copyWithWrapped({Wrapped<String?>? task, Wrapped<bool>? done}) {
    return ToDoDto(
      task: (task != null ? task.value : this.task),
      done: (done != null ? done.value : this.done),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UserDto {
  const UserDto({this.customerName, this.username, this.password});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  static const toJsonFactory = _$UserDtoToJson;
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(name: 'customerName')
  final String? customerName;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$UserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserDto &&
            (identical(other.customerName, customerName) ||
                const DeepCollectionEquality().equals(
                  other.customerName,
                  customerName,
                )) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customerName) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $UserDtoExtension on UserDto {
  UserDto copyWith({String? customerName, String? username, String? password}) {
    return UserDto(
      customerName: customerName ?? this.customerName,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  UserDto copyWithWrapped({
    Wrapped<String?>? customerName,
    Wrapped<String?>? username,
    Wrapped<String?>? password,
  }) {
    return UserDto(
      customerName: (customerName != null
          ? customerName.value
          : this.customerName),
      username: (username != null ? username.value : this.username),
      password: (password != null ? password.value : this.password),
    );
  }
}

String? carStatusEnumNullableToJson(enums.CarStatusEnum? carStatusEnum) {
  return carStatusEnum?.value;
}

String? carStatusEnumToJson(enums.CarStatusEnum carStatusEnum) {
  return carStatusEnum.value;
}

enums.CarStatusEnum carStatusEnumFromJson(
  Object? carStatusEnum, [
  enums.CarStatusEnum? defaultValue,
]) {
  return enums.CarStatusEnum.values.firstWhereOrNull(
        (e) => e.value == carStatusEnum,
      ) ??
      defaultValue ??
      enums.CarStatusEnum.swaggerGeneratedUnknown;
}

enums.CarStatusEnum? carStatusEnumNullableFromJson(
  Object? carStatusEnum, [
  enums.CarStatusEnum? defaultValue,
]) {
  if (carStatusEnum == null) {
    return null;
  }
  return enums.CarStatusEnum.values.firstWhereOrNull(
        (e) => e.value == carStatusEnum,
      ) ??
      defaultValue;
}

String carStatusEnumExplodedListToJson(
  List<enums.CarStatusEnum>? carStatusEnum,
) {
  return carStatusEnum?.map((e) => e.value!).join(',') ?? '';
}

List<String> carStatusEnumListToJson(List<enums.CarStatusEnum>? carStatusEnum) {
  if (carStatusEnum == null) {
    return [];
  }

  return carStatusEnum.map((e) => e.value!).toList();
}

List<enums.CarStatusEnum> carStatusEnumListFromJson(
  List? carStatusEnum, [
  List<enums.CarStatusEnum>? defaultValue,
]) {
  if (carStatusEnum == null) {
    return defaultValue ?? [];
  }

  return carStatusEnum.map((e) => carStatusEnumFromJson(e.toString())).toList();
}

List<enums.CarStatusEnum>? carStatusEnumNullableListFromJson(
  List? carStatusEnum, [
  List<enums.CarStatusEnum>? defaultValue,
]) {
  if (carStatusEnum == null) {
    return defaultValue;
  }

  return carStatusEnum.map((e) => carStatusEnumFromJson(e.toString())).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
