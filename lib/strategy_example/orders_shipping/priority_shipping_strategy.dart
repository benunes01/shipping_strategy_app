import 'package:shipping_strategy_app/strategy_example/ishipping_costs_strategy.dart';
import 'package:shipping_strategy_app/strategy_example/order/order.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = "Priority shipping";

  @override
  double calculate(Order order) {
    return 9.99;
  }

}