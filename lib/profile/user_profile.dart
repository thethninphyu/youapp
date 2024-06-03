import 'package:flutter/material.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/widgets/background.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YouAppColor.profileBackgroundColor,
      appBar: AppBar(
        backgroundColor: YouAppColor.profileBackgroundColor,
        title: const Text(
          'About',
          style: TextStyle(color: YouAppColor.whiteColor),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle save & update action
            },
            child: const Text(
              'Save & Update',
              style: TextStyle(color: YouAppColor.goldenColor, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, size: 40),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Add image',
                  style: TextStyle(fontSize: 18, color: YouAppColor.whiteColor),
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildTextField('Display name:', 'Enter name'),
            buildDropdownField('Gender:', 'Select Gender'),
            buildTextField('Birthday:', 'DD MM YYYY'),
            buildTextField('Horoscope:', '--'),
            buildTextField('Zodiac:', '--'),
            buildTextField('Height:', 'Add height'),
            buildTextField('Weight:', 'Add weight'),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(hint),
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                    DropdownMenuItem(
                      value: 'Other',
                      child: Text('Other'),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle change
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
