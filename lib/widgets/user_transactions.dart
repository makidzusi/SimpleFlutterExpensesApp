import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        amount: 10.99, id: 't1', date: DateTime.now(), title: "Новые кросы"),
    Transaction(
        amount: 15.99, id: 't2', date: DateTime.now(), title: "Новые шорты"),
    Transaction(
        amount: 15.99, id: 't2', date: DateTime.now(), title: "Новые шорты")
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        amount: amount,
        date: DateTime.now(),
        title: title,
        id: DateTime.now().toString());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          onTransactionAdd: _addNewTransaction,
        ),
        TransactionList(
          transactions: _transactions,
        )
      ],
    );
  }
}
