class ReservationOption {
  final String id;
  final String optionName;
  final String optionDescription;

  final DateTime startDate;
  final DateTime endDate;

  final int unitPrice;

  const ReservationOption({
    required this.id,
    required this.optionName,
    required this.optionDescription,
    required this.startDate,
    required this.endDate,
    required this.unitPrice,
  });

  String get priceDisplay =>
      "${(unitPrice / 100).toStringAsFixed(2)} €";

  factory ReservationOption.fromJson(Map<String, dynamic> json) {
    return ReservationOption(
      id: json['id'],
      optionName: json['optionName'],
      optionDescription: json['optionDescription'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      unitPrice: json['unitPrice'],
    );
  }
}