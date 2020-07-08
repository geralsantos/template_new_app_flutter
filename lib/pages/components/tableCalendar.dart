import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:probando_flutter/vistas/listadoClases.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime today = DateTime.now();
final _selectedDay = today;
dynamic _week = today.weekday;

class TableCalendarC extends StatefulWidget {
  TableCalendarC({Key key}) : super(key: key);
  @override
  _TableCalendarCState createState() => _TableCalendarCState();
}

class _TableCalendarCState extends State<TableCalendarC> {
  CalendarController _controller;
  Map<DateTime, List> _events;
  List _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _events = {
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7']
    };
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      height: size.height-100,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        TableCalendar(
          events: _events,
          calendarController: _controller,
          initialCalendarFormat: CalendarFormat.week,
          calendarStyle: CalendarStyle(
            todayColor: Theme.of(context).secondaryHeaderColor,
            selectedColor: Colors.blue[200],
            todayStyle: TextStyle(color: Colors.white),
          ),
          onDaySelected: (date, events) {
            print(events);
            setState(() {
              _selectedEvents = events;
            });
          },
          onVisibleDaysChanged: (dateF, dateL, format) {
            print(dateF);
            print(dateL);
            print(format);
          },
          availableCalendarFormats: {
            CalendarFormat.week: "Semana",
          },
          headerStyle: HeaderStyle(
              formatButtonDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0)),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonShowsNext: false),
          startingDayOfWeek: StartingDayOfWeek.monday,
        ),
        Expanded(
            child: Container(
          child: ListadoClases(),
        ))
      ]),
    ));
  }
/*
  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }*/
}
