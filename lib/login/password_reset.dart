import 'package:flutter/material.dart';


class ResetPasswordScreen extends StatefulWidget {
  static const routeName = 'reset-password';
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  String _selectedOption = 'Get OTP on Email';

  void _sendOTP() {
    final input = _emailOrPhoneController.text;

    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your email or phone number')),
      );
      return;
    }

    // Mock OTP generation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP sent to $_selectedOption: $input')),
    );

    // Add your API logic here to send OTP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/sports.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3), // Optional: Add overlay
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Recover your AS Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: _selectedOption,
                  items: ['Get OTP on Email', 'Get OTP on Phone']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailOrPhoneController,
                  keyboardType: _selectedOption == 'Get OTP on Email'
                      ? TextInputType.emailAddress
                      : TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: _selectedOption == 'Get OTP on Email'
                        ? 'Enter your email address'
                        : 'Enter your phone number',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _sendOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}