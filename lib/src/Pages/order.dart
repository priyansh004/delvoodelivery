import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  accepted,
  rejected,
}

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  List<FriendOrder> _orders = [];

  @override
  void initState() {
    super.initState();
    _initOrders();
  }

  void _initOrders() {
    _orders = List.generate(
      4,
      (index) => FriendOrder(
        index + 1,
        'Friend $index',
        'Order $index',
      ),
    );
  }

  void _acceptOrder(int index) {
    setState(() {
      _orders[index].status = OrderStatus.accepted;
    });
  }

  void _rejectOrder(int index) {
    setState(() {
      _orders[index].status = OrderStatus.rejected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders List'),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          FriendOrder order = _orders[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(order.friendName[0]),
            ),
            title: Text(order.friendName),
            subtitle: Text(order.orderDetails),
            trailing: order.status == OrderStatus.pending
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () => _acceptOrder(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => _rejectOrder(index),
                      ),
                    ],
                  )
                : Text(
                    order.status == OrderStatus.accepted
                        ? 'Accepted'
                        : 'Rejected',
                  ),
          );
        },
      ),
    );
  }
}

class FriendOrder {
  int index;
  String friendName;
  String orderDetails;
  OrderStatus status;

  FriendOrder(this.index, this.friendName, this.orderDetails,
      {this.status = OrderStatus.pending});
}
