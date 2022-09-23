// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:ferriapp/models/marketplace.dart';
import 'package:ferriapp/page/cart.dart';
import 'package:ferriapp/page/shoppingcart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Store extends StatefulWidget {
  const Store({Key key}) : super(key: key);
  static const routeName = '/home';

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$");
  final GlobalKey<ScaffoldState> _globalkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
            key: _globalkey,
            backgroundColor: Color(0xffFFC300),
            appBar: AppBar(
              backgroundColor: Color(0xff000814),
              centerTitle: true,
              title: Text(
                'MARKETPLACE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              bottom: TabBar(
                indicatorColor: Color(0xffFFD60A),
                tabs: const [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        'Herramientas Electricas',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        'Herramientas Manuales',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        'Plomeria',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        cart?.numItems != 0
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoppingCart(
                                          cart: cart,
                                        )))
                            : _globalkey.currentState.showSnackBar(SnackBar(
                                content: Text('Agregar producto'),
                              ));
                      },
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Color(0xffFFC300),
                            borderRadius: BorderRadius.circular(10)),
                        constraints:
                            BoxConstraints(minWidth: 14, minHeight: 14),
                        child: Text(
                          '${cart?.numItems}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000814)),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            body: TabBarView(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: herraElectricas.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                                'assets/' + herraElectricas[index].image,
                                height: 150),
                            Text(
                              herraElectricas[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(herraElectricas[index].descripcion,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    textAlign: TextAlign.center)),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                (numberFormat.format(
                                  herraElectricas[index].price,
                                )),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: RaisedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      cart?.addItem(
                                          herraElectricas[index].id.toString(),
                                          herraElectricas[index].name,
                                          herraElectricas[index].price,
                                          '1',
                                          herraElectricas[index].image,
                                          1);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  color: Color(0xff001D3D),
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Agregar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: herraManuales.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: [
                            Image.asset('assets/' + herraManuales[index].image,
                                height: 150),
                            Text(
                              herraManuales[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(herraManuales[index].descripcion,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    textAlign: TextAlign.center)),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                (numberFormat.format(
                                  herraManuales[index].price,
                                )),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: RaisedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      cart?.addItem(
                                          herraManuales[index].id.toString(),
                                          herraManuales[index].name,
                                          herraManuales[index].price,
                                          '1',
                                          herraManuales[index].image,
                                          1);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  color: Color(0xff001D3D),
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Agregar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: plomeria.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.1),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: [
                            Image.asset('assets/' + plomeria[index].image,
                                height: 150),
                            Text(
                              plomeria[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(plomeria[index].descripcion,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    textAlign: TextAlign.center)),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                (numberFormat.format(
                                  plomeria[index].price,
                                )),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: RaisedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      cart?.addItem(
                                          plomeria[index].id.toString(),
                                          plomeria[index].name,
                                          plomeria[index].price,
                                          '1',
                                          plomeria[index].image,
                                          1);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  color: Color(0xff001D3D),
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Agregar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      );
    });
  }
}
