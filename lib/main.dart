import 'package:flutter/material.dart';
import 'package:shipping_strategy_app/strategy_example/ishipping_costs_strategy.dart';
import 'package:shipping_strategy_app/strategy_example/order/order.dart';
import 'package:shipping_strategy_app/strategy_example/order/order_item.dart';
import 'package:shipping_strategy_app/strategy_example/orders_shipping/in_store_pickup_strategy.dart';
import 'package:shipping_strategy_app/strategy_example/orders_shipping/parcel_terminal_shipping_strategy.dart';
import 'package:shipping_strategy_app/strategy_example/orders_shipping/priority_shipping_strategy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StrategyApp(),
    );
  }
}

class StrategyApp extends StatefulWidget {
  @override
  _StrategyAppState createState() => _StrategyAppState();
}

class _StrategyAppState extends State<StrategyApp> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];
  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState(() {
      _order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int index) {
    setState(() {
      _selectedStrategyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    child: Text("Adicionar novo pedido"),
                    onPressed: _addToOrder,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text("Limpar pedidos"),
                    onPressed: _clearOrder,
                  )
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: _order.items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(_order.items
                              .elementAt(index)
                              .title),
                          subtitle: Text(
                              _order.items
                                  .elementAt(index)
                                  .price
                                  .toString()),
                          leading: Text(_order.items
                              .elementAt(index)
                              .packageSize
                              .toString()
                              .split(".")
                              .elementAt(1)),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            ShippingOptions(
              selectedIndex: _selectedStrategyIndex,
              shippingOptions: _shippingCostsStrategyList,
              onChanged: _setSelectedStrategyIndex,
            ),
            OrderSummary(
              order: _order,
              shippingCostsStrategy: _shippingCostsStrategyList[_selectedStrategyIndex],
            )
          ],
        ),
      ),
    );
  }
}

class ShippingOptions extends StatelessWidget {
  final List<IShippingCostsStrategy> shippingOptions;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ShippingOptions({
    @required this.shippingOptions,
    @required this.selectedIndex,
    @required this.onChanged,
  })
      : assert(shippingOptions != null),
        assert(selectedIndex != null),
        assert(onChanged != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Selecione o tipo de frete:"
            ),
            for (var i = 0; i < shippingOptions.length; i++)
              RadioListTile<int>(
                title: Text(shippingOptions[i].label),
                value: i,
                groupValue: selectedIndex,
                onChanged: onChanged,
                dense: true,
                activeColor: Colors.black,
                controlAffinity: ListTileControlAffinity.platform,
              )
          ],
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  final Order order;
  final IShippingCostsStrategy shippingCostsStrategy;

  const OrderSummary({
    @required this.order,
    @required this.shippingCostsStrategy,
  })
      : assert(order != null),
        assert(shippingCostsStrategy != null);

  double get shippingPrice => shippingCostsStrategy.calculate(order);
  double get total => order.price + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Resumo do pedido"
            ),
            Text(
              'Total dos pedidos: ${order.price.toStringAsFixed(2)}'
            ),
            Text(
                'Total do frete: ${shippingPrice.toStringAsFixed(2)}'
            ),
            Text(
                'Total: ${total.toStringAsFixed(2)}'
            )
          ],
        ),
      ),
    );
  }
}