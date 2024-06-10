import 'package:flutter/material.dart';
import 'package:youapp/util/app_color.dart';

class AppDropDownFiled extends StatelessWidget {
  final String label;
  final String hint;
  final BuildContext context;
  const AppDropDownFiled(
      {super.key,
      required this.label,
      required this.hint,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 16,
                    color: YouAppColor.whiteColor.withOpacity(0.33)),
              ),
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
                  hint: Text(
                    hint,
                    style: TextStyle(
                        color: YouAppColor.whiteColor.withOpacity(0.3)),
                  ),
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
