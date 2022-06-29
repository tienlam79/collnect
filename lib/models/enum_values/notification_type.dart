import 'enum_values.dart';

enum NotificationType {
  COMPLETED_ORDER,
  PROMOTION,
}

final notifcationTypeValues = EnumValues({
  "order_completed": NotificationType.COMPLETED_ORDER,
  "promotion": NotificationType.PROMOTION,
});
