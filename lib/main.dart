import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/cart_provider.dart';
import 'package:provider_app/provider/product_provider.dart';
import 'package:provider_app/task/product_list_page.dart';
import 'provider/counter_provider.dart';
import 'provider/list_map_provider.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: MaterialApp(

        title: 'Demo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        home: ProductListPage(),
      ),
    );
  }
}
