import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class ProviderCounterApp extends StatelessWidget {
  const ProviderCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('Build method called');
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Provider Counter App')),
      body: Center(
        child: Consumer(
          builder: (context, _, _) {
            log('Consumer build called');
            return Text(
              '${context.watch<CounterProvider>().getCount()}',
              // '${Provider.of<CounterProvider>(context, listen: true).getCount()}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().decrementCount();
            },
            child: Icon(Icons.remove),
          ),

          FloatingActionButton(
            onPressed: () {
              // Provider.of<CounterProvider>(context, listen: false).incrementCount();
              context.read<CounterProvider>().incrementCount();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
