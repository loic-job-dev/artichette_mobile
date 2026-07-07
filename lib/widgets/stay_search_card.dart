import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'filled_button.dart';
import 'date_range_picker.dart';

class StaySearchCard extends StatefulWidget {
  const StaySearchCard({
    super.key,
    required this.onSearch,
  });

  final void Function(
      DateTime startBookedDate,
      DateTime endBookedDate,
      int adults,
      int children,
      ) onSearch;

  @override
  State<StaySearchCard> createState() => _StaySearchCardState();
}

class _StaySearchCardState extends State<StaySearchCard> {
  DateTime? _startDate;
  DateTime? _endDate;

  final _formatter = DateFormat('dd/MM/yyyy');
  int _adults = 2;
  int _children = 0;

  Future<void> _selectDates() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        onRangeSelected: (range) {
          Navigator.pop(context); // fermer modal
          setState(() {
            _startDate = range.start;
            _endDate = range.end;
          });
        },
      ),
    );
  }

  String get _dateLabel {
    if (_startDate == null || _endDate == null) {
      return "Sélectionner les dates";
    }

    return "${_formatter.format(_startDate!)} → ${_formatter.format(_endDate!)}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text("Séjour"),
              subtitle: Text(_dateLabel),
              trailing: const Icon(Icons.chevron_right),
              onTap: _selectDates,
            ),

            const Divider(),

            Row(
              children: [
                const Icon(Icons.people),
                const SizedBox(width: 16),

                const Expanded(
                  child: Text("Voyageurs"),
                ),

                IconButton(
                  onPressed: _adults > 1
                      ? () {
                    setState(() {
                      _adults--;
                    });
                  }
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),

                Text(
                  "$_adults",
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      _adults++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                onPressed: (_startDate != null && _endDate != null)
                    ? () {
                  widget.onSearch(
                    _startDate!,
                    _endDate!,
                    _adults,
                    _children,
                  );
                }
                    : null,
                compact: false,
                child: const Text("Rechercher une chambre"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}