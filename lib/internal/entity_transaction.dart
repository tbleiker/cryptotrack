List<Transaction> getTransactions({
  String filter = '',
}) {
  return <Transaction>[
    Transaction(name: 'Transaction A'),
    Transaction(name: 'Transaction B'),
    Transaction(name: 'Transaction C'),
    Transaction(name: 'Transaction D'),
    Transaction(name: 'Transaction E'),
    Transaction(name: 'Transaction F'),
    Transaction(name: 'Transaction G'),
    Transaction(name: 'Transaction H'),
  ].where((element) => element.name.contains(filter)).toList();
}

class Transaction {
  final String name;

  Transaction({
    required this.name,
  });
}
