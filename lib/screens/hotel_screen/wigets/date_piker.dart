import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTimeRange? dateTimeRange;
  var int;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        pickDateRange();
      //  print(int);
      },
      child: Container(
          width: 150,
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("When:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(getFrom(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  Text('-'),
                  Text(getUntil(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          )),
    );
  }

  Future pickDateRange() async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        Duration(hours: 24),
      ),
    );
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: dateTimeRange ?? initialDateRange);

    if (newDateRange == null) return;

    setState(() {
      dateTimeRange = newDateRange;

    });
  }

  String getFrom() {
    if (dateTimeRange == null) {
      return 'From';
    } else {
      return DateFormat('dd').format(dateTimeRange!.start);

    }
  }

  String getUntil() {
    if (dateTimeRange == null) {
      return 'Until';
    } else {
      return DateFormat('d MMM').format(dateTimeRange!.end);
    }
  }
}
