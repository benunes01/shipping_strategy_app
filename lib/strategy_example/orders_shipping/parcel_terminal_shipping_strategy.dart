import 'package:shipping_strategy_app/enums/package_size.dart';
import 'package:shipping_strategy_app/strategy_example/ishipping_costs_strategy.dart';
import 'package:shipping_strategy_app/strategy_example/order/order.dart';
import 'package:shipping_strategy_app/strategy_example/order/order_item.dart';

class ParcelTerminalShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = "Parcel terminal shipping";

  @override
  double calculate(Order order) {
    return order.items.fold<double>(
      0.0,
      (sum, item) => sum + _getOrderItemShippingPrice(item),
    );
  }

  double _getOrderItemShippingPrice(OrderItem orderItem) {
    switch (orderItem.packageSize) {
      case PackageSize.S:
        return 1.99;
      case PackageSize.M:
        return 2.49;
      case PackageSize.L:
        return 2.99;
      case PackageSize.XL:
        return 3.49;
      default:
        throw new Exception(
            "Unknown shipping price for the package of size `${orderItem.packageSize}`.");
    }
  }
}
