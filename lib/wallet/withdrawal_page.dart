import 'package:flutter/material.dart';


class WithdrawalScreen extends StatefulWidget {
  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  bool isFormVisible = false;
  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String? selectedBank;

  final List<String> banks = ['Access Bank', 'Access (Diamone)Bank', 'Citi Bank', 'Ecobank', 'Fidelity Bank', 'First bank'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdrawal'),
        backgroundColor: Colors.green,
        actions: [
          Icon(Icons.headset_mic),
          SizedBox(width: 10),
          Icon(Icons.mail),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '₦0.00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Bank Transfer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Make your withdrawal using bank details.'),
            SizedBox(height: 10),

            // Add New Bank Account Section
            Card(
              elevation: 4,
              child: ListTile(
                title: Text('Add new Bank Account'),
                trailing: IconButton(
                  icon: Icon(isFormVisible ? Icons.close : Icons.add),
                  onPressed: () {
                    setState(() {
                      isFormVisible = !isFormVisible;
                    });
                  },
                ),
              ),
            ),

            // Expanded Form
            if (isFormVisible)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: accountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Account Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedBank,
                      items: banks
                          .map((bank) => DropdownMenuItem(
                                value: bank,
                                child: Text(bank),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedBank = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Bank',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),

            SizedBox(height: 20),

            // Amount Input
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount (₦)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Withdrawal Button
            ElevatedButton(
              onPressed: () {
                if (amountController.text.isNotEmpty &&
                    (isFormVisible
                        ? (accountController.text.isNotEmpty && selectedBank != null)
                        : true)) {
                  // Perform withdrawal action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Withdrawal initiated!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all required fields.')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Withdrawal'),
            ),
          ],
        ),
      ),
    );
  }
}