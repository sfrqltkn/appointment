import 'package:appointment/appointment/bloc/appointment_state.dart';
import 'package:appointment/appointment/bloc/choose_date_cubit.dart';
import 'package:appointment/appointment/widget/choose_date_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../data/model/booking_datetime_converted.dart';
import '../widget/choose_date_widget.dart';

class ChooseDatePage extends StatefulWidget {
  const ChooseDatePage({super.key, required this.state, required this.price});

  final AppointmentState state;
  final String price;
  @override
  State<ChooseDatePage> createState() => _ChooseDatePageState();
}

class _ChooseDatePageState extends State<ChooseDatePage> {
  //declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _dateSelected = false;
  bool _timeSelected = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  const ChooseTextWidget(text: 'Select Appointment Day'),
                  _tableCalendar(),
                  const ChooseTextWidget(text: 'Select Appointment Time')
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                        debugPrint("currentIndex: $_currentIndex");
                        _timeSelected = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.brown,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 10}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _currentIndex == index ? Colors.white : null,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, childAspectRatio: 1.1),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("${widget.price}  TL"),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: ChooseDateButton(
                        width: 250,
                        title: 'Make Appointment',
                        onPressed: () async {
                          final getDate = DateConverted.getDate(_currentDay);
                          final getDay =
                              DateConverted.getDay(_currentDay.weekday);
                          final getTime = DateConverted.getTime(_currentIndex!);
                          debugPrint(getDay);
                          debugPrint(getDate);
                          context.read<ChooseDateCubit>().updateAndCreate(
                              _auth.currentUser!.uid.toString(),
                              getDate,
                              getDay,
                              getTime,
                              widget.price,
                              widget.state.selectedOperation!.name.toString(),
                              widget.state.selectedPerson!.name.toString());
                        },
                        disable: _timeSelected && _dateSelected ? false : true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 37,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Colors.brown, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
        });
      }),
    );
  }
}
