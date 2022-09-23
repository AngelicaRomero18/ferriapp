import 'package:ferriapp/models/item.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {
  final Map<String, Item> _items = {};
  List<Item> items = [];

  int get numItems {
    var amountTotal = 0;
    for (var item in items) {
      amountTotal = amountTotal + item.amount;
    }
    return amountTotal;
  }

  double get total {
    var total = 0.0;
    for (var elementos in items) {
      total += elementos.price * elementos.amount;
    }
    return total;
  }

  void addItem(String productoId, String name, double price, String unit,
      String image, int amount) {
    var newItem = Item(
        id: productoId,
        name: name,
        price: price,
        unit: unit,
        image: image,
        amount: 1);
    if (_items.containsKey(productoId)) {
      _items.update(
          productoId,
          (old) => Item(
              id: old.id,
              name: old.name,
              price: old.price,
              unit: old.unit,
              image: old.image,
              amount: old.amount + 1));
    } else {
      _items.putIfAbsent(productoId, () => newItem);
      items.add(newItem);
    }
    notifyListeners();
  }

  void deleteItem(
    String productoId,
  ) {
    var itemFound = items.firstWhere((item) => item.id == productoId);
    items.remove(itemFound);
    _items.remove(productoId);
    notifyListeners();
  }

  void deleteCart() {
    items = [];
    _items.clear();
    notifyListeners();
  }

  void increaseAmount(String productoId) {
    var itemFound = items.firstWhere((item) => item.id == productoId);
    itemFound.amount = itemFound.amount + 1;
    notifyListeners();
  }

  void decreaseAmount(String productoId) {
    var itemFound = items.firstWhere((item) => item.id == productoId);
    if (itemFound.amount > 1) {
      itemFound.amount = itemFound.amount - 1;
    }
    notifyListeners();
  }
}
