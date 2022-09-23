// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ferriapp/page/cart.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key key, this.cart}) : super(key: key);
  final Cart cart;
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$");
  Cart cart;

  @override
  void initState() {
    cart = widget.cart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff001D3D),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFC300),
        centerTitle: true,
        title: const Text(
          'Carrito de compras',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  cart?.numItems != 0
                      ? setState(() {
                          cart.deleteCart();
                        })
                      : const SnackBar(
                          content: Text('Carrito Vacio'),
                        );
                },
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        child: cart.numItems == 0
            ? const Center(
                child: Text('Carrito basio'),
              )
            : Column(
                children: cart.items
                    .map((item) => Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/' + item.image,
                                  width: 100,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.all(5),
                                height: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0xff000814),
                                        )),
                                    Text(
                                      numberFormat.format(item.price) + ' UND',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color(0xff000814),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            height: 30,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                color: Color(0xffFFC300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            child: IconButton(
                                              alignment: Alignment.center,
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  cart.decreaseAmount(item.id);
                                                });
                                              },
                                            )),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: Text(
                                              item.amount.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 30,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                color: Color(0xffFFC300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.add,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  cart.increaseAmount(item.id);
                                                });
                                              },
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      child: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Color(0xff000814)),
                                    onPressed: () {
                                      setState(() {
                                        cart.deleteItem(
                                          item.id,
                                        );
                                      });
                                    },
                                  )),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.all(5),
                                    child: Center(
                                      child: Text(
                                        (numberFormat.format(
                                          item.price * item.amount,
                                        )),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xff000814),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                            ])))
                    .toList(),
              ),
      )),
      floatingActionButton: Container(
        height: 40.0,
        width: 200.0,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color(0xffFFD60A),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Text(
          'Total:  ' + numberFormat.format(cart.total),
          style: const TextStyle(
              color: Color(0xff000814),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
