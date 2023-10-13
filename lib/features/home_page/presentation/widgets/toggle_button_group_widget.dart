import 'package:flutter/material.dart';

class ToggleButtonGroup extends StatefulWidget {
  final Function(bool) onToggleSelection;

  ToggleButtonGroup({required this.onToggleSelection});
  @override
  _ToggleButtonGroupState createState() => _ToggleButtonGroupState();
}

class _ToggleButtonGroupState extends State<ToggleButtonGroup> {
  bool isReturnSelected = true;

  void toggleSelection() {
    setState(() {
      isReturnSelected = !isReturnSelected;
      widget.onToggleSelection(isReturnSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (!isReturnSelected) {
                    toggleSelection();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isReturnSelected ? Colors.white : null,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      'Return',
                      style: TextStyle(
                        color: isReturnSelected
                            ? Color(0xFF071952).withOpacity(0.7)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (isReturnSelected) {
                    toggleSelection();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: !isReturnSelected ? Colors.white : null,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      'One-Way',
                      style: TextStyle(
                        color: !isReturnSelected
                            ? Color(0xFF071952).withOpacity(0.7)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
