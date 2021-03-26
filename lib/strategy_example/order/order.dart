import 'package:shipping_strategy_app/strategy_example/order/order_item.dart';

class Order {
  final List<OrderItem> items = List<OrderItem>();

  double get price =>
      items.fold(0.0, (sum, orderItem) => sum + orderItem.price);

  void addOrderItem(OrderItem orderItem) {
    items.add(orderItem);
  }
}