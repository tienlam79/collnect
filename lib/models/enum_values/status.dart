import 'enum_values.dart';

enum Status {
  CREATED,
  CONFIRMED,
  RESELLER_RECEIVED,
  PROCESSING,
  COMPLETED,
  EXPIRED
}

final statusValues = EnumValues({
  "created": Status.CREATED,
  "confirmed": Status.CONFIRMED,
  "reseller_received": Status.RESELLER_RECEIVED,
  'processing': Status.PROCESSING,
  'completed': Status.COMPLETED,
  'expired': Status.EXPIRED,
});
