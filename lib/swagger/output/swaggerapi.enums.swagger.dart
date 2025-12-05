// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

enum CarStatusEnum {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Warteschlange')
  warteschlange('Warteschlange'),
  @JsonValue('InBearbeitung')
  inbearbeitung('InBearbeitung'),
  @JsonValue('Abholbereit')
  abholbereit('Abholbereit');

  final String? value;

  const CarStatusEnum(this.value);
}
