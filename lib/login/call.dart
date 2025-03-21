import 'package:flutter/material.dart';



class WithdrawalScreen1 extends StatefulWidget {
  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen1> {
  bool isFormVisible = false;
  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedBank;
  final List<String> banks = ['Access Bank', 'Access (Diamone)Bank', 'Citi Bank', 'Ecobank', 'Fidelity Bank', 'First bank'];

  void _processWithdrawal() {
    String accountNumber = accountController.text.trim();
    String amount = amountController.text.trim();
    String password = passwordController.text.trim();

    if (amount.isEmpty) {
      _showSnackbar("Please enter an amount.");
      return;
    }
    if (isFormVisible && (accountNumber.isEmpty || selectedBank == null)) {
      _showSnackbar("Please fill in account details.");
      return;
    }
    if (password.length != 6 || !RegExp(r'^\d{6}$').hasMatch(password)) {
      _showSnackbar("Enter a valid 6-digit transaction password.");
      return;
    }

    _showSnackbar("Withdrawal Successful!");
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

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
            Text('₦0.00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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

            // Expanded Form for Bank Details
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
            SizedBox(height: 10),

            // Transaction Password Input
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: 'Transaction Password',
                border: OutlineInputBorder(),
                counterText: "",
              ),
            ),
            SizedBox(height: 20),

            // Withdrawal Button
            ElevatedButton(
              onPressed: _processWithdrawal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
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


// import 'package:flutter/material.dart';



// class WithdrawalScreen1 extends StatefulWidget {
//   @override
//   _WithdrawalScreenState createState() => _WithdrawalScreenState();
// }

// class _WithdrawalScreenState extends State<WithdrawalScreen1> {
//   bool hasTransactionPassword = false;
//   bool isCreatePasswordVisible = false;
//   bool isEditPasswordVisible = false;

//   final TextEditingController oldPasswordController = TextEditingController();
//   final TextEditingController newPasswordController = TextEditingController();
//   final TextEditingController createPasswordController = TextEditingController();

//   void _createTransactionPassword() {
//     String newPassword = createPasswordController.text.trim();

//     if (newPassword.isEmpty || newPassword.length != 6 || !RegExp(r'^\d{6}$').hasMatch(newPassword)) {
//       _showSnackbar("Transaction password must be a 6-digit number.");
//       return;
//     }

//     setState(() {
//       hasTransactionPassword = true;
//       isCreatePasswordVisible = false;
//     });

//     _showSnackbar("Transaction password created successfully!");
//   }

//   void _editTransactionPassword() {
//     String oldPassword = oldPasswordController.text.trim();
//     String newPassword = newPasswordController.text.trim();

//     if (oldPassword.isEmpty || newPassword.isEmpty) {
//       _showSnackbar("Both fields are required.");
//       return;
//     }
//     if (newPassword.length != 6 || !RegExp(r'^\d{6}$').hasMatch(newPassword)) {
//       _showSnackbar("New password must be a 6-digit number.");
//       return;
//     }

//     // Simulate password update
//     _showSnackbar("Transaction password updated successfully!");
//     Navigator.push(context, MaterialPageRoute(builder: (context) => WalletScreen()));
//   }

//   void _showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Withdrawal'),
//         backgroundColor: Colors.red,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Bank Transfer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Text('Make your withdrawal using bank details.'),
//             SizedBox(height: 10),

//             // Toggle Card for Creating Transaction Password
//             if (!hasTransactionPassword)
//               Card(
//                 elevation: 4,
//                 child: ListTile(
//                   title: Text('Create Transaction Password'),
//                   trailing: IconButton(
//                     icon: Icon(isCreatePasswordVisible ? Icons.close : Icons.add),
//                     onPressed: () {
//                       setState(() {
//                         isCreatePasswordVisible = !isCreatePasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),

//             // Create Password Form
//             if (isCreatePasswordVisible)
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: createPasswordController,
//                       keyboardType: TextInputType.number,
//                       obscureText: true,
//                       maxLength: 6,
//                       decoration: InputDecoration(
//                         labelText: 'Enter New Transaction Password',
//                         border: OutlineInputBorder(),
//                         counterText: "",
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _createTransactionPassword,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         minimumSize: Size(double.infinity, 50),
//                       ),
//                       child: Text('Create Password'),
//                     ),
//                   ],
//                 ),
//               ),

//             // Toggle Card for Editing Transaction Password
//             if (hasTransactionPassword)
//               Card(
//                 elevation: 4,
//                 child: ListTile(
//                   title: Text('Edit Transaction Password'),
//                   trailing: IconButton(
//                     icon: Icon(isEditPasswordVisible ? Icons.close : Icons.edit),
//                     onPressed: () {
//                       setState(() {
//                         isEditPasswordVisible = !isEditPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),

//             // Edit Password Form
//             if (isEditPasswordVisible)
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: oldPasswordController,
//                       keyboardType: TextInputType.number,
//                       obscureText: true,
//                       maxLength: 6,
//                       decoration: InputDecoration(
//                         labelText: 'Enter Old Password',
//                         border: OutlineInputBorder(),
//                         counterText: "",
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       controller: newPasswordController,
//                       keyboardType: TextInputType.number,
//                       obscureText: true,
//                       maxLength: 6,
//                       decoration: InputDecoration(
//                         labelText: 'Enter New Password',
//                         border: OutlineInputBorder(),
//                         counterText: "",
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _editTransactionPassword,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         minimumSize: Size(double.infinity, 50),
//                       ),
//                       child: Text('Update Password'),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // WalletScreen (Navigation Target)
// class WalletScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Wallet")),
//       body: Center(child: Text("Transaction Password Updated!")),
//     );
//   }
// }