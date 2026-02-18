// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CarStatusApi.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTicketDto _$CreateTicketDtoFromJson(Map<String, dynamic> json) =>
    CreateTicketDto(
      userId: (json['userId'] as num).toInt(),
      customerName: json['customerName'] as String?,
      car: json['car'] as String?,
      carStatus: carStatusEnumNullableFromJson(json['carStatus']),
      toDos:
          (json['toDos'] as List<dynamic>?)
              ?.map((e) => ToDoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CreateTicketDtoToJson(CreateTicketDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'customerName': instance.customerName,
      'car': instance.car,
      'carStatus': carStatusEnumNullableToJson(instance.carStatus),
      'toDos': instance.toDos?.map((e) => e.toJson()).toList(),
    };

DbTicket _$DbTicketFromJson(Map<String, dynamic> json) => DbTicket(
  id: (json['id'] as num).toInt(),
  ticketnumber: json['ticketnumber'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  customerName: json['customerName'] as String,
  car: json['car'] as String,
  carStatus: carStatusEnumFromJson(json['carStatus']),
  toDos:
      (json['toDos'] as List<dynamic>?)
          ?.map((e) => DbToDos.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  user:
      json['user'] == null
          ? null
          : DbUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DbTicketToJson(DbTicket instance) => <String, dynamic>{
  'id': instance.id,
  'ticketnumber': instance.ticketnumber,
  'userId': instance.userId,
  'customerName': instance.customerName,
  'car': instance.car,
  'carStatus': carStatusEnumToJson(instance.carStatus),
  'toDos': instance.toDos?.map((e) => e.toJson()).toList(),
  'user': instance.user?.toJson(),
};

DbToDos _$DbToDosFromJson(Map<String, dynamic> json) => DbToDos(
  id: (json['id'] as num).toInt(),
  todo: json['todo'] as String,
  done: json['done'] as bool,
  dbTicketId: (json['dbTicketId'] as num?)?.toInt(),
  ticket:
      json['ticket'] == null
          ? null
          : DbTicket.fromJson(json['ticket'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DbToDosToJson(DbToDos instance) => <String, dynamic>{
  'id': instance.id,
  'todo': instance.todo,
  'done': instance.done,
  'dbTicketId': instance.dbTicketId,
  'ticket': instance.ticket?.toJson(),
};

DbUser _$DbUserFromJson(Map<String, dynamic> json) => DbUser(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  password: json['password'] as String,
  isAdmin: json['isAdmin'] as bool,
  tickets:
      (json['tickets'] as List<dynamic>?)
          ?.map((e) => DbTicket.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$DbUserToJson(DbUser instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'password': instance.password,
  'isAdmin': instance.isAdmin,
  'tickets': instance.tickets?.map((e) => e.toJson()).toList(),
};

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
  ticketnumber: json['ticketnumber'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  customerName: json['customerName'] as String?,
  car: json['car'] as String?,
  carStatus: carStatusEnumNullableFromJson(json['carStatus']),
  toDos:
      (json['toDos'] as List<dynamic>?)
          ?.map((e) => ToDoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
  'ticketnumber': instance.ticketnumber,
  'userId': instance.userId,
  'customerName': instance.customerName,
  'car': instance.car,
  'carStatus': carStatusEnumNullableToJson(instance.carStatus),
  'toDos': instance.toDos?.map((e) => e.toJson()).toList(),
};

ToDoDto _$ToDoDtoFromJson(Map<String, dynamic> json) => ToDoDto(
  id: (json['id'] as num).toInt(),
  task: json['task'] as String?,
  done: json['done'] as bool,
);

Map<String, dynamic> _$ToDoDtoToJson(ToDoDto instance) => <String, dynamic>{
  'id': instance.id,
  'task': instance.task,
  'done': instance.done,
};

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  customerName: json['customerName'] as String?,
  username: json['username'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'customerName': instance.customerName,
  'username': instance.username,
  'password': instance.password,
};
