import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/user.dart';

const mockClient = User(
  firstName: "Jean",
  lastName: "Dupont",
  phoneNumber: "06 12 34 56 78",
  pseudo: "Jeandup",
  email: "fake@mail.com",
  media: "https://media.licdn.com/dms/image/v2/D4D03AQHyNrqbK_p30w/profile-displayphoto-shrink_200_200/B4DZVSI5jMGcAc-/0/1740839820425?e=2147483647&v=beta&t=NhNJ3SOpmxKbn_kaGBv8FlifcbU9aW-AIt_jPOSSnS8",
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