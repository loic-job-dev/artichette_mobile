import 'package:artichette/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'filled_button.dart';
import 'date_range_picker.dart';

class StaySearchCard extends StatefulWidget {
  const StaySearchCard({super.key, required this.onSearch});

  final void Function(
    DateTime startBookedDate,
    DateTime endBookedDate,
    int adults,
    int children,
  )
  onSearch;

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

  String _dateLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_startDate == null || _endDate == null) {
      return l10n.staySearchCard_selectDates;
    }

    return "${_formatter.format(_startDate!)} → ${_formatter.format(_endDate!)}";
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text(l10n.staySearchCard_stay),
              subtitle: Text(_dateLabel(context)),
              trailing: const Icon(Icons.chevron_right),
              onTap: _selectDates,
            ),

            const Divider(),

            Row(
              children: [
                const Icon(Icons.people),
                const SizedBox(width: 16),

                Expanded(child: Text(l10n.staySearchCard_travelers)),

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
                child: Text(l10n.staySearchCard_searchRoom),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
