import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/client.dart';

const mockClient = Client(
  firstName: "Jean",
  lastName: "Dupont",
  phoneNumber: "06 12 34 56 78",
  pseudo: "Jeandup",
  addresses: {
    Address(
      streetNumber: 42,
      streetType: "Rue",
      streetName: "des Artichauts",
      addressComplement: "Bâtiment B, Appartement 12",
      zipCode: "69003",
      city: "Lyon",
    ),
  },
);