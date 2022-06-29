import 'enum_values.dart';

enum OrderStatus {
  FAILED,
  SUCCESS,
}

final orderStatusValues = EnumValues({
  "failed": OrderStatus.FAILED,
  "success": OrderStatus.SUCCESS,
});
