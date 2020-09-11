import 'package:flutter/cupertino.dart';

class Transaction {
  final int transId;
  final DateTime tranDate;
  final double amount;
  final bool status;

  Transaction(
      {@required this.transId,
      @required this.tranDate,
      @required this.amount,
      @required this.status});
}

class TransactionProvider with ChangeNotifier {
  List<Transaction> _items = [
    Transaction(
        transId: 2500221, tranDate: DateTime.now(), amount: 500, status: true),
    Transaction(
        transId: 0000025, tranDate: DateTime.now(), amount: 500, status: true),
    Transaction(
        transId: 0000025, tranDate: DateTime.now(), amount: 500, status: true),
    Transaction(
        transId: 0000025, tranDate: DateTime.now(), amount: 500, status: true),
    Transaction(
        transId: 0000025, tranDate: DateTime.now(), amount: 500, status: true),
    Transaction(
        transId: 0000025, tranDate: DateTime.now(), amount: 500, status: true),
  ];

  List<Transaction> get items {
    return [..._items];
  }
}
