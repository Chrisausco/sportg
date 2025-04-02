import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ReferralScreen extends StatefulWidget {
  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String referralCode = "";
  double walletBalance = 0.0;
  List<Map<String, dynamic>> referredUsers = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      setState(() {
        referralCode = userDoc['referralCode'];
        walletBalance = userDoc['walletBalance'];
      });

      // Fetch referred users
      QuerySnapshot referredDocs = await FirebaseFirestore.instance
          .collection('users')
          .where('referredBy', isEqualTo: referralCode)
          .get();

      setState(() {
        referredUsers =
            referredDocs.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });
    }
  }

  void copyReferralCode() {
    Clipboard.setData(ClipboardData(text: referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Referral code copied!")),
    );
  }

  void withdrawBalance() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Withdraw request submitted!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Referral Program")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Referral Code", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(referralCode, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                  ),
                ),
                IconButton(icon: Icon(Icons.copy), onPressed: copyReferralCode),
              ],
            ),
            SizedBox(height: 20),

            Text("Wallet Balance: \$${walletBalance.toStringAsFixed(2)}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: withdrawBalance,
              child: Text("Withdraw Funds"),
            ),

            SizedBox(height: 20),
            Text("Referred Users", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: referredUsers.isEmpty
                  ? Center(child: Text("No referrals yet!"))
                  : ListView.builder(
                      itemCount: referredUsers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(referredUsers[index]['email']),
                          subtitle: Text("Joined: ${referredUsers[index]['createdAt']}"),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}