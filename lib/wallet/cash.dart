import 'package:flutter/material.dart';


class WalletDashboard extends StatelessWidget {
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
        title: Text(
          "Wallets",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
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
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Add cash"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Cash out"),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Transactions
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: "Send",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Recipients",
          ),
        ],
        selectedItemColor: Colors.purple,
      ),
    );
  }
}