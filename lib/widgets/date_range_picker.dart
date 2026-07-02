import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../theme/calendar_style.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sélectionnez vos dates",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: TableCalendar(
              locale: 'fr_FR',

              firstDay: DateTime.now(),
              lastDay: DateTime(DateTime.now().year + 2),
              focusedDay: _focusedDay,

              calendarFormat: CalendarFormat.month,

              availableCalendarFormats: const {
                CalendarFormat.month: 'Mois',
              },

              onFormatChanged: null,

              rangeSelectionMode: RangeSelectionMode.enforced,

              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,

              selectedDayPredicate: (day) =>
              isSameDay(_rangeStart, day) ||
                  isSameDay(_rangeEnd, day),

              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _rangeStart = selectedDay;
                  _rangeEnd = null;
                  _focusedDay = focusedDay;
                });
              },

              onRangeSelected: (start, end, focusedDay) {
                setState(() {
                  _rangeStart = start;
                  _rangeEnd = end;
                  _focusedDay = focusedDay;
                });
              },

              calendarStyle: calendarStyle,
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (_rangeStart != null && _rangeEnd != null)
                  ? () {
                Navigator.pop(
                  context,
                  DateTimeRange(
                    start: _rangeStart!,
                    end: _rangeEnd!,
                  ),
                );
              }
                  : null,
              child: const Text("Valider"),
            ),
          ),
        ],
      ),
    );
  }
}