import 'package:flutter/cupertino.dart';


void main() => runApp(const CupertinoFormRowApp());

class CupertinoFormRowApp extends StatelessWidget {
  const CupertinoFormRowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoFormRowExample(),
    );
  }
}

class CupertinoFormRowExample extends StatefulWidget {
  const CupertinoFormRowExample({super.key});

  @override
  State<CupertinoFormRowExample> createState() => _CupertinoFormRowExampleState();
}

class _CupertinoFormRowExampleState extends State<CupertinoFormRowExample> {
  bool airplaneMode =false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:const CupertinoNavigationBar(middle: Text("Form Section By Cupertino"),),
      child: SafeArea(
        child: CupertinoFormSection(
          header: const Text('Connectivity'),
          children: <Widget>[
            CupertinoFormRow(
              prefix: const Prefixwidget(
                icon:CupertinoIcons.airplane,
                title: 'Airplane',
                color: CupertinoColors.systemOrange,
              ),
              child: CupertinoSwitch(
                value: airplaneMode, 
                onChanged: (bool value){
                  setState(() {
                    airplaneMode = value;
                  });
                },
              ),
            ),

            const CupertinoFormRow(
              prefix: Prefixwidget(icon: CupertinoIcons.wifi, title: 'Wi-Fi', color: CupertinoColors.systemBlue),
              error: Text('Home network unavailable'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Not Connected"),
                  SizedBox(width: 5,),
                  Icon(CupertinoIcons.forward),
                ],
              ),
            ),

            const CupertinoFormRow(
              prefix: Prefixwidget(icon: CupertinoIcons.bluetooth, title: 'Bluetooth', color: CupertinoColors.activeBlue),
              helper: Padding(padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Headphone"),
                    Text("Connected"),
                  ],
                ),
              ), child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[Text('On'), SizedBox(width: 5,),Icon(CupertinoIcons.forward)],
              ),
            ),

            const CupertinoFormRow(
              prefix: Prefixwidget(icon: CupertinoIcons.bluetooth, title: 'Mobile Data', color: CupertinoColors.systemGreen),
              child: Icon(CupertinoIcons.forward),
            ),
          ],
        ),
      ),
    );
  }
}

class Prefixwidget extends StatelessWidget {
  const Prefixwidget({super.key, required this.icon, required this.title,  required this.color});

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4.0)),
          child: Icon(icon, color: CupertinoColors.white),
        ),
        const SizedBox(width: 15,),Text(title),
      ],
    );
  }
}