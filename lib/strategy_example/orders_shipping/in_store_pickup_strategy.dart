import 'package:shipping_strategy_app/strategy_example/ishipping_costs_strategy.dart';
import 'package:shipping_strategy_app/strategy_example/order/order.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = "In-store pickup";

  @override
  double calculate(Order order) {
    return 0.0;
  }
}