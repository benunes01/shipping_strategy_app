import 'package:shipping_strategy_app/strategy_example/order/order.dart';

abstract class IShippingCostsStrategy {
  String label;
  double calculate(Order order);
}