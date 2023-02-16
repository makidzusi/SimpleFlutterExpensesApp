import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        amount: 10.99, id: 't1', date: DateTime.now(), title: "Новые кросы"),
    Transaction(
        amount: 15.99, id: 't2', date: DateTime.now(), title: "Новые шорты")
  ];

  final TextEditingController titleContoller = TextEditingController();
  final TextEditingController amountContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            width: double.infinity,
            child: const Card(color: Colors.black26, child: Text('chart')),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                TextField(
                  decoration: const InputDecoration(label: Text("Title")),
                  controller: titleContoller,
                ),
                TextField(
                  decoration: const InputDecoration(label: Text("Amount")),
                  controller: amountContoller,
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            transactions.add(Transaction(
                                amount: 1,
                                date: DateTime.now(),
                                title: titleContoller.text,
                                id: "t${transactions.length}"));
                          });
                        },
                        child: const Text("Добавить покупку")))
              ]),
            ),
          ),
          Column(
            children: transactions
                .map((tx) => Card(
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2)),
                          child: Text(
                            ' \$ ${tx.amount}',
                            style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd HH:mm').format(tx.date),
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ]),
                    ))
                .toList(),
          )
        ]));
  }
}
