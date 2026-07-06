import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/client.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final Client client;

  const ProfileScreen({super.key, required this.client});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _pseudoController = TextEditingController();
  final _mailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _pictureUrlController = TextEditingController();

  final _streetNumberController = TextEditingController();
  final _streetTypeController = TextEditingController();
  final _streetNameController = TextEditingController();
  final _addressComplementController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _cityController = TextEditingController();

  bool editPictureUrl = false;

  @override
  void initState() {
    super.initState();

    final client = widget.client;
    final Address? address = client.addresses.isNotEmpty
        ? client.addresses.first
        : null;

    _firstNameController.text = client.firstName;
    _lastNameController.text = client.lastName;
    _pseudoController.text = client.pseudo ?? "";
    _phoneNumberController.text = client.phoneNumber;

    //TODO : récupérer l'image
    _pictureUrlController.text =
        "https://api.dicebear.com/9.x/adventurer/png?seed=${client.firstName}";

    //TODO : récupérér le mail
    _mailController.text = "${client.firstName}@${client.lastName}.com";

    if (address != null) {
      _streetNumberController.text = address.streetNumber.toString();
      _streetTypeController.text = address.streetType;
      _streetNameController.text = address.streetName;
      _addressComplementController.text = address.addressComplement ?? "";
      _zipCodeController.text = address.zipCode;
      _cityController.text = address.city;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _pseudoController.dispose();
    _mailController.dispose();
    _phoneNumberController.dispose();
    _pictureUrlController.dispose();
    _streetNumberController.dispose();
    _streetTypeController.dispose();
    _streetNameController.dispose();
    _addressComplementController.dispose();
    _zipCodeController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  Client updatedClient() {
    final address = Address(
      streetNumber: int.parse(_streetNumberController.text),
      streetType: _streetTypeController.text,
      streetName: _streetNameController.text,
      addressComplement: _addressComplementController.text.isEmpty
          ? null
          : _addressComplementController.text,
      zipCode: _zipCodeController.text,
      city: _cityController.text,
    );

    return Client(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNumber: _phoneNumberController.text,
      pseudo: _pseudoController.text.isEmpty ? null : _pseudoController.text,
      addresses: {address},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (editPictureUrl) ...[
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _pictureUrlController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          labelText: 'Lien vers votre photo',
                        ),
                        keyboardType: TextInputType.url,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => editPictureUrl = !editPictureUrl);
                      },
                      icon: Icon(Icons.check),
                    ),
                  ],
                ),
              ],
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Theme.of(context).colorScheme.outline,
                      child: CircleAvatar(
                        radius: 68,
                        backgroundImage: NetworkImage(
                          _pictureUrlController.text,
                        ),
                      ),
                    ),
                  ),

                  if (!editPictureUrl) ...[
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() => editPictureUrl = !editPictureUrl);
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: "Prénom"),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir un prénom";
                        }

                        if (value.length > 50) {
                          return "Le prénom est trop long (50 caractères maximum).";
                        }

                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: "Nom"),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir un nom.";
                        }

                        if (value.length > 50) {
                          return "Le nom est trop long (50 caractères maximum).";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _pseudoController,
                decoration: InputDecoration(labelText: "Pseudo"),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value != null && value.length > 50) {
                    return "Le pseudo est trop long (50 caractères maximum).";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mailController,
                decoration: InputDecoration(labelText: "Email"),
                readOnly: true,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: "Numéro de téléphone"),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez saisir un numéro de téléphone.";
                  }
                  if (value.length > 15) {
                    return "Le numéro de téléphone est trop long (15 caractères maximum).";
                  }
                  return null;
                },
              ),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _streetNumberController,
                      decoration: InputDecoration(labelText: "N° Rue"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir un numéro de rue.";
                        }

                        final number = int.tryParse(value);

                        if (number == null) {
                          return "Le numéro doit être un entier";
                        }

                        if (number < 1) {
                          return "Le numéro doit être supérieur à 0";
                        }

                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _streetTypeController,
                      decoration: InputDecoration(labelText: "Type de voie"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir un type de voie.";
                        }

                        if (value.length > 10) {
                          return "Le type de voie est trop long (10 caractères maximum).";
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _streetNameController,
                decoration: InputDecoration(labelText: "Nom de la voie"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez saisir un nom de voie.";
                  }

                  if (value.length > 50) {
                    return "Le nom de la voie est trop long (50 caractères maximum).";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _addressComplementController,
                decoration: InputDecoration(labelText: "Complément d'adresse"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value != null && value.length > 50) {
                    return "Le complément d'adresse est trop long (50 caractères maximum).";
                  }

                  return null;
                },
              ),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _zipCodeController,
                      decoration: InputDecoration(labelText: "Code Postal"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir un code postal.";
                        }

                        if (value.length > 10) {
                          return "Le code postal est trop long (10 caractères maximum).";
                        }

                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(labelText: "Ville"),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez saisir une ville.";
                        }

                        if (value.length > 10) {
                          return "Le nom de la ville est trop long (50 caractères maximum).";
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    final client = updatedClient();

                    print(client);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Implémentation en cours'),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "C'est compris, je vais faire une sieste",
                          onPressed: () {
                            // TODO: implémenter l'appel API
                          },
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.save_outlined),
                  label: Text('Enregistrer les modifications'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Implémentation en cours'),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "C'est compris, je vais prendre un thé.",
                          onPressed: () {
                            // TODO: implémenter le logout
                          },
                        ),
                      ),
                    ),
                  },
                  icon: Icon(Icons.logout),
                  label: Text('Se déconnecter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
