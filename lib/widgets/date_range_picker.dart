import 'package:artichette/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../theme/calendar_style.dart';

class DateRangePicker extends StatefulWidget {
  final void Function(DateTimeRange range)? onRangeSelected;

  const DateRangePicker({super.key, this.onRangeSelected});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dateRangePicker_chooseDate,
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
              locale: Localizations.localeOf(context).toString(),

              firstDay: DateTime.now(),
              lastDay: DateTime(DateTime.now().year + 2),
              focusedDay: _focusedDay,

              calendarFormat: CalendarFormat.month,

              availableCalendarFormats:  {CalendarFormat.month: l10n.dateRangePicker_month},

              onFormatChanged: null,

              rangeSelectionMode: RangeSelectionMode.enforced,

              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,

              selectedDayPredicate: (day) =>
                  isSameDay(_rangeStart, day) || isSameDay(_rangeEnd, day),

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
                      widget.onRangeSelected?.call(
                        DateTimeRange(start: _rangeStart!, end: _rangeEnd!),
                      );
                    }
                  : null,
              child: Text(l10n.dateRangePicker_validate),
            ),
          ),
        ],
      ),
    );
  }
}
