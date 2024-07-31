import 'package:flutter/material.dart';

class feedback_form extends StatefulWidget {
  const feedback_form({super.key});

  @override
  State<feedback_form> createState() => _feedback_formState();
}

class _feedback_formState extends State<feedback_form> {
  int _rating = 0;
  String _feedbackText = '';
  String _userEmail = '';

  // Validation for email (optional, based on your needs)
  bool _isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(email);
  }

  void _submitFeedback() {
    if (_isEmailValid(_userEmail) && _feedbackText.isNotEmpty) {
      // Send feedback to backend or store locally
      print('Feedback: $_rating, $_feedbackText, $_userEmail');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide valid email and feedback text'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/feedbackimg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Text(
                //   'Rate your experience:',
                //   style: TextStyle(fontSize: 18),
                // ),
                SizedBox(height: 10),
                // Use a third-party package like flutter_rating_bar for star rating
                // Or implement your own custom rating widget
                // RatingBar(
                //   initialRating: _rating.toDouble(),
                //   onRatingUpdate: (rating) => setState(() => _rating = rating.toInt()),
                // ),
                SizedBox(height: 100),
                Center( // Remove centering for the column
                  child: Column( // Use Column for vertical arrangement
                    children: [
                      // Feedback text field (limited width)
                      Container(
                        width: 300.0, // Set a fixed width for the container
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Tell us what you think',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0), // Adjust content padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (text) => setState(() => _feedbackText = text),
                        ),
                      ),
                      SizedBox(height: 35.0), // Add spacing between TextFields
                      // Email text field (limited width)
                      Container(
                        width: 300.0, // Set a fixed width for the container
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email (optional)',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0), // Adjust content padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (text) => setState(() => _userEmail = text),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _submitFeedback,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),

                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button background color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}