import 'package:flutter/material.dart';
import 'otp_verification.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});
  
  static final routeName = 'register';
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  String fullName = '';
  String phoneNumber = '';
  String email = '';
  String username = '';
  String sponsorUsername = '';
  String password = '';
  String confirmPassword = '';
  DateTime? dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Register'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/sports.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildTextField('Full Name', (value) => fullName = value!, 'Please enter your full name'),
                    buildTextField('Phone Number', (value) => phoneNumber = value!, 'Enter a valid phone number', TextInputType.phone),
                    buildTextField('Email Address', (value) => email = value!, 'Enter a valid email address', TextInputType.emailAddress, r'^[^@]+@[^@]+\.[^@]+'),
                    buildTextField('Username', (value) => username = value!, 'Please enter a username'),
                    buildTextField('Sponsor Username', (value) => sponsorUsername = value!, 'Please enter sponsor username'),
                    buildDateOfBirthPicker(),
                    buildPasswordField('Password', _passwordController, _passwordVisible, () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    }),
                    buildConfirmPasswordField('Confirm Password', _passwordController, _confirmPasswordVisible, () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPVerification(email: email),
                            ),
                          );
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Text Field Builder
  Widget buildTextField(
    String label,
    Function(String?) onSave,
    String validationMessage, [
    TextInputType keyboardType = TextInputType.text,
    String? pattern,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationMessage;
          }
          if (pattern != null && !RegExp(pattern).hasMatch(value)) {
            return 'Invalid $label';
          }
          return null;
        },
        onSaved: onSave,
      ),
    );
  }

  // Date of Birth Picker
  Widget buildDateOfBirthPicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            setState(() {
              dateOfBirth = pickedDate;
            });
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            dateOfBirth == null ? 'Select your date of birth' : '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  // Password Field with Visibility Toggle
  Widget buildPasswordField(String label, TextEditingController controller, bool isVisible, VoidCallback toggleVisibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: toggleVisibility,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          // if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
          //   return 'Password must have at least 8 characters,\n1 uppercase letter, 1 number, and 1 special character';
          // }
          if(value.length < 8){
            return 'Password must have at least 8 characters';
          }
          return null;
        },
        onSaved: (value) => password = value!,
      ),
    );
  }

  // Confirm Password Field with Visibility Toggle
  Widget buildConfirmPasswordField(String label, TextEditingController passwordController, bool isVisible, VoidCallback toggleVisibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: !isVisible,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: toggleVisibility,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please confirm your password';
          }
          if (value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        onSaved: (value) => confirmPassword = value!,
      ),
    );
  }
}