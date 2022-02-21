List<Wallet> getWallets({
  String filter = '',
}) {
  return <Wallet>[
    Wallet(name: 'Wallet A'),
    Wallet(name: 'Wallet B'),
    Wallet(name: 'Wallet C'),
    Wallet(name: 'Wallet D'),
  ].where((element) => element.name.contains(filter)).toList();
}

class Wallet {
  final String name;

  Wallet({
    required this.name,
  });
}
