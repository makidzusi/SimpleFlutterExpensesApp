import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/dismissible_bg.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList(
      {super.key, required this.transactions, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    "No transactions",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    background: const DismissibleBg(),
                    secondaryBackground: const DismissibleBg(),
                    onDismissed: (dir) {
                      deleteTx(transactions[index].id);
                    },
                    key: ObjectKey(index),
                    child: Card(
                      elevation: 6,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FittedBox(
                                child: Text('\$${transactions[index].amount}')),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                        ),
                        subtitle: Text(DateFormat.yMMMMd()
                            .format(transactions[index].date)),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
