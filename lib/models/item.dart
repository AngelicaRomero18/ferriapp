// ignore_for_file: prefer_collection_literals, unnecessary_new

class Item {
  String id;
  String name;
  double price;
  String unit;
  String image;
  int amount;

  Item({this.id, this.name, this.price, this.unit, this.image, this.amount});

  Item.map(dynamic json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        unit = json['unit'],
        image = json['image'],
        amount = json['amount'];

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['unit'] = unit;
    map['image'] = image;
    map['amount'] = amount;
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['unit'] = unit;
    data['image'] = image;
    data['amount'] = amount;
    return data;
  }
}
