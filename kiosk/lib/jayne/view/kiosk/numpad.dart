import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

class NumPad extends StatefulWidget {
  const NumPad({super.key});

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  String input = '0';

  void onNumPress(String num) {
    setState(() {
      if (input == '0') {
        input = num;
      } else {
        input += num;
      }
    });
  }

  void onDelete() {
    setState(() {
      if (input.length > 1) {
        input = input.substring(0, input.length - 1);
      } else {
        input = '0';
      }
    });
  }

  void onClear() {
    setState(() {
      input = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: '฿', decimalDigits: 0);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // Semi-transparent background
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display the price
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  formatter.format(int.parse(input)),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Keypad buttons
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  KeyPadButton(label: '7', onPressed: () => onNumPress('7')),
                  KeyPadButton(label: '8', onPressed: () => onNumPress('8')),
                  KeyPadButton(label: '9', onPressed: () => onNumPress('9')),
                  KeyPadButton(label: '4', onPressed: () => onNumPress('4')),
                  KeyPadButton(label: '5', onPressed: () => onNumPress('5')),
                  KeyPadButton(label: '6', onPressed: () => onNumPress('6')),
                  KeyPadButton(label: '1', onPressed: () => onNumPress('1')),
                  KeyPadButton(label: '2', onPressed: () => onNumPress('2')),
                  KeyPadButton(label: '3', onPressed: () => onNumPress('3')),
                  KeyPadButton(label: '0', onPressed: () => onNumPress('0')),
                  KeyPadButton(icon: Icons.backspace, onPressed: onDelete),
                  KeyPadButton(label: 'AC', onPressed: onClear),
                ],
              ),
              const SizedBox(height: 20),

              // Cancel and Confirm buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle cancel action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: Text('jayne.common.confirm'.tr()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle confirm action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('jayne.common.cancel'.tr()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeyPadButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;

  const KeyPadButton({
    super.key,
    this.label,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: label != null
            ? Text(
                label!,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              )
            : Icon(
                icon,
                size: 24,
                color: Colors.black,
              ),
      ),
    );
  }
}
