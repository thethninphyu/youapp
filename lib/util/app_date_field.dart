import 'package:flutter/material.dart';
import 'package:youapp/util/app_color.dart';

class AppDateTextField extends StatefulWidget {
  final String label;
  final String hint;
  final Function(String string) callBackController;
  final Function(String string) horoscopeSign;
  final Function(String string) zodiacSign;
  const AppDateTextField(
      {super.key,
      required this.label,
      required this.hint,
      required this.callBackController,
      required this.horoscopeSign,
      required this.zodiacSign});

  @override
  State<AppDateTextField> createState() => _AppDateTextFieldState();
}

class _AppDateTextFieldState extends State<AppDateTextField> {
  TextEditingController textEditingController = TextEditingController();
  String horoscopeSign = "";
  String zodizcSign = "";

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        textEditingController.text = "${picked.toLocal()}".split(' ')[0];
        widget.callBackController("${picked.toLocal()}".split(' ')[0]);
        widget.horoscopeSign(getHoroscopeSign(picked));
        widget.zodiacSign(getZodiacSign(picked));
      });
    }
  }

  String getHoroscopeSign(DateTime date) {
    int day = date.day;
    int month = date.month;

    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Aquarius";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return "Pisces";
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricorn";
    } else {
      return "Unknown";
    }
  }

  String getZodiacSign(DateTime date) {
    int year = date.year;

    switch ((year - 4) % 12) {
      case 0:
        return "Rat";
      case 1:
        return "Ox";
      case 2:
        return "Tiger";
      case 3:
        return "Rabbit";
      case 4:
        return "Dragon";
      case 5:
        return "Snake";
      case 6:
        return "Horse";
      case 7:
        return "Goat";
      case 8:
        return "Monkey";
      case 9:
        return "Rooster";
      case 10:
        return "Dog";
      case 11:
        return "Pig";
      default:
        return "Unknown";
    }
  }

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
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                widget.label,
                style: TextStyle(
                    fontSize: 16,
                    color: YouAppColor.whiteColor.withOpacity(0.33)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: textEditingController,
              onTap: () {
                selectDate();
              },
              style: const TextStyle(color: YouAppColor.whiteColor),
              decoration: InputDecoration(
                hintText: widget.hint,
                isDense: true,
                hintStyle:
                    TextStyle(color: YouAppColor.whiteColor.withOpacity(0.3)),
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
}
