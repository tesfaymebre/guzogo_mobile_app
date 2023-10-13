import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionWidget extends StatefulWidget {
  final bool isReturnSelected;

  DateSelectionWidget({required this.isReturnSelected});

  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  DateTime? departureDate;
  DateTime? returnDate;

  @override
  void initState() {
    super.initState();
    if (!widget.isReturnSelected) {
      // If it's not a return date selection, initialize departureDate
      departureDate = DateTime.now();
    } else {
      // If it's a return date selection, initialize both dates
      departureDate = DateTime.now();
      returnDate = DateTime.now().add(Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey, // Set border color
        width: 1.0, // Set border width
      ),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          children: [
            if (!widget.isReturnSelected)
              _buildDateCell("Departure Date", () {
                // TODO: Show departure date selection dialog
              }),
            if (!widget.isReturnSelected) _buildDateCell("", () {}),
            if (widget.isReturnSelected)
              _buildDateCell("Departure Date", () {
                // TODO: Show departure date selection dialog
              }),
            if (widget.isReturnSelected)
              _buildDateCell("Return Date", () {
                // TODO: Show return date selection dialog
              }),
          ],
        ),
      ],
    );
  }

  Widget _buildDateCell(String title, VoidCallback onTap) {
    return TableCell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.20,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  if (title.isNotEmpty && title == "Departure Date")
                    Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                child: Text(departureDate!.day.toString(),
                                    style: TextStyle(
                                        fontSize: 48,
                                        color: Color(0xFF071952))),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(DateFormat('MMM').format(departureDate!),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                      DateFormat('EEEE').format(departureDate!),
                                      style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  else if (title.isNotEmpty && title == "Return Date")
                    Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                child: Text(returnDate!.day.toString(),
                                    style: TextStyle(
                                        fontSize: 48,
                                        color: Color(0xFF071952))),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(DateFormat('MMM').format(returnDate!),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  Text(DateFormat('EEEE').format(returnDate!),
                                      style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateSelectionPage extends StatefulWidget {
  final bool selectReturnDate;

  DateSelectionPage({required this.selectReturnDate});

  @override
  _DateSelectionPageState createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  // TODO: Implement date selection
}
