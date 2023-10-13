import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTableWidget extends StatefulWidget {
  @override
  _CustomTableWidgetState createState() => _CustomTableWidgetState();
}

class _CustomTableWidgetState extends State<CustomTableWidget> {
  int adults = 1;
  int children = 0;
  int infants = 0;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      columnWidths: {
        0: FlexColumnWidth(1), // Adjust the widths as needed
        1: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Cabin Class',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Economy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showPassengerDialog(context);
              },
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Passengers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        children: [
                          _buildPassengerIcon(FontAwesomeIcons.person, adults),
                          _buildPassengerIcon(
                              FontAwesomeIcons.person, children),
                          _buildPassengerIcon(FontAwesomeIcons.baby, infants),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPassengerIcon(IconData icon, int count) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPassengerDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Passengers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        adults = adults;
                        children = children;
                        infants = infants;
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _buildPassengerRow('Adult', adults),
              _buildPassengerRow('Children 2 - 12 Years', children),
              _buildPassengerRow('Infant <2 Years', infants),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPassengerRow(String label, int count) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              _buildPassengerButton(FontAwesomeIcons.minus, () {
                if (count > 0) {
                  setState(() {
                    count--;
                  });
                }
              }),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 20),
              ),
              _buildPassengerButton(FontAwesomeIcons.plus, () {
                setState(() {
                  count++;
                });
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPassengerButton(IconData icon, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 20,
        color: Colors.grey,
      ),
    );
  }
}
