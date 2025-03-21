import 'package:flutter/material.dart';



class WalletScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {"amount": "NGN 2,000.00", "type": "Debit card", "color": "green"},
    {"amount": "NGN 3,000.00", "type": "Transfer/Janet Jackson", "color": "red"},
    {"amount": "NGN 2,000.00", "type": "Debit card", "color": "green"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:const Text(
          "Wallets",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon:const Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Card
            Container(
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(12),
              ),
              padding:const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "5,000 NGN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.flag, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nigerian Naira",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Add cash",
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Cash out",
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                ),
              ],
            ),
           const SizedBox(height: 20),
            // Transactions
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Transactions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        final color = transaction["color"] == "green"
                            ? Colors.green
                            : Colors.red;
                        return ListTile(
                          leading: Icon(
                            Icons.account_balance_wallet,
                            color: color,
                          ),
                          title: Text(
                            transaction["amount"]!,
                            style: TextStyle(color: color),
                          ),
                          subtitle: Text(transaction["type"]!),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}