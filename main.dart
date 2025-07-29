import 'package:flutter/cupertino.dart';

void main() => runApp(const DatePickerApp());

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: DatePickerAppExample(),
    );
  }
}

class DatePickerAppExample extends StatefulWidget {
  const DatePickerAppExample({super.key});

  @override
  State<DatePickerAppExample> createState() => _DatePickerAppExampleState();
}

class _DatePickerAppExampleState extends State<DatePickerAppExample> {

  DateTime date = DateTime(2026, 01, 01);
  DateTime time = DateTime(2026, 01, 01, 00, 01);
  DateTime dateTime = DateTime(2026, 01, 01, 00, 01);

  //This is function displays a CupertinoModalPopup with a reasonable fixed height 
  //Which hosts Cupertino Data Picker
  void _showDialog(Widget child){
    showCupertinoModalPopup(
      context: context, 
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),

        //The Bottom margin is provides to align the popup above the system navigationBar.
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

        //Provide a background color for the popup
        color: CupertinoColors.systemBackground.resolveFrom(context),

        //Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(top: false, child: child,),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('CupertinoDatePicker Sample')),
      child: DefaultTextStyle(style: TextStyle(color: CupertinoColors.label.resolveFrom(context), fontSize:18.0 ), 
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _DatePickerItem(
                children: <Widget>[
                  const Text('Date'),
                  CupertinoButton(
                  
                    //This is example, the date is formatted manually. You can use the initial package to format the value based on the user local
                    child: Text('${date.month}-${date.day}-${date.year}',
                    style: const TextStyle(fontSize: 18.0)),
                    //Display a CupertinoDataPicker in date picker mode
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: date,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        //This is show day of week along day of month
                        showDayOfWeek: true,
                        //This is call when the user change the date.
                        onDateTimeChanged: (DateTime newDate){
                          setState(() {
                            date = newDate;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              _DatePickerItem(
                children: <Widget>[
                  const Text('Time',style: TextStyle(fontSize: 22.0),),
                  CupertinoButton(
                    child: Text('${time.hour}:${time.minute}'), 
                    onPressed: () => _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: time,
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                      //this is call with use change the time
                      onDateTimeChanged:( DateTime newTime)
                      {
                        setState(() {
                          time = newTime;
                        });
                      }
                    ),
                  ))
                ],
              ),

              _DatePickerItem(
                children:<Widget> [
                  const Text('DateTime'),
                  CupertinoButton(child: Text('${dateTime.month}-${dateTime.day}-${dateTime.year}/${dateTime.hour}:${dateTime.minute}',
                  style: const TextStyle(fontSize: 22.0),
                  ),
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: dateTime,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDateTime){
                        setState(() {
                          dateTime = newDateTime;
                        });
                      }),
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


//This is sample Row of widget
class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0.0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children : children ),
      ),
    );
  }
}