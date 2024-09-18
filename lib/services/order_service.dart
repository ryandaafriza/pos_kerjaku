class Order {
  static final List<Map<String, dynamic>> orderList = [];

  static void addOrderToList(Map<String, dynamic> orderData) {
    if (orderData.isEmpty ||
        orderData['title'] == null ||
        orderData['quantity'] == null ||
        orderData['total'] == null) {
      print("Invalid order data: $orderData");
      return;
    }

    print("addOrderToList called with: $orderData");
    int index =
        orderList.indexWhere((order) => order['title'] == orderData['title']);

    if (index != -1) {
      orderList[index]['quantity'] += orderData['quantity'];
      orderList[index]['total'] += orderData['total'];
    } else {
      orderList.add(orderData);
    }

    print("New order added or updated: $orderData");
    print("Current order list: $orderList");
  }

  static List<Map<String, dynamic>> getOrderList() {
    return orderList;
  }

  static void removeOrderAt(int index) {
    if (index >= 0 && index < orderList.length) {
      orderList.removeAt(index);
    }
  }
}
