// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swaggerapi.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTicketDto _$CreateTicketDtoFromJson(Map<String, dynamic> json) =>
    CreateTicketDto(
      customerName: json['customerName'] as String?,
      car: json['car'] as String?,
      carStatus: carStatusEnumNullableFromJson(json['carStatus']),
      toDos:
          (json['toDos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
    );

Map<String, dynamic> _$CreateTicketDtoToJson(CreateTicketDto instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'car': instance.car,
      'carStatus': carStatusEnumNullableToJson(instance.carStatus),
      'toDos': instance.toDos,
    };

DbUser _$DbUserFromJson(Map<String, dynamic> json) => DbUser(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  password: json['password'] as String,
  isAdmin: json['isAdmin'] as bool,
);

Map<String, dynamic> _$DbUserToJson(DbUser instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'password': instance.password,
  'isAdmin': instance.isAdmin,
};

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
  ticketnumber: json['ticketnumber'] as String?,
  customerName: json['customerName'] as String?,
  car: json['car'] as String?,
  carStatus: carStatusEnumNullableFromJson(json['carStatus']),
  toDos:
      (json['toDos'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
);

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
  'ticketnumber': instance.ticketnumber,
  'customerName': instance.customerName,
  'car': instance.car,
  'carStatus': carStatusEnumNullableToJson(instance.carStatus),
  'toDos': instance.toDos,
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
