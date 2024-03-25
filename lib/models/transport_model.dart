import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'transport_model.g.dart';

@HiveType(typeId: 0)
class TransportModel {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final int rentalCost;
  @HiveField(2)
  final String paymentType;
  @HiveField(3)
  final String tenantName;
  @HiveField(4)
  final String state;
  @HiveField(5)
  final String comment;

  TransportModel(
      {required this.type,
      required this.rentalCost,
      required this.paymentType,
      required this.tenantName,
      required this.state,
      required this.comment,
      });
}
