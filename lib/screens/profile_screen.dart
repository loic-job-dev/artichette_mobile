import 'package:artichette/domain/models/address.dart';
import 'package:artichette/domain/models/client.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

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

  final _passwordController = TextEditingController();

  bool _editPictureUrl = false;
  bool _obscurePassword = true;

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
    _passwordController.dispose();
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_editPictureUrl) ...[
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _pictureUrlController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          labelText: l10n.profile_pictureLinkLabel,
                        ),
                        keyboardType: TextInputType.url,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => _editPictureUrl = !_editPictureUrl);
                      },
                      icon: Icon(Icons.check),
                    ),
                  ],
                ),
              ],

              Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: CircleAvatar(
                          radius: 67,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.outline,
                          backgroundImage: NetworkImage(
                            _pictureUrlController.text,
                          ),
                        ),
                      ),
                      if (!_editPictureUrl) ...[
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(
                                () => _editPictureUrl = !_editPictureUrl,
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: l10n.profile_firstNameLabel),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.profile_firstNameRequired;
                        }

                        if (value.length > 50) {
                          return l10n.profile_firstNameTooLong;
                        }

                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: l10n.profile_lastNameLabel),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.profile_lastNameRequired;
                        }

                        if (value.length > 50) {
                          return l10n.profile_lastNameTooLong;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _pseudoController,
                decoration: InputDecoration(labelText: l10n.profile_pseudoLabel),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value != null && value.length > 50) {
                    return l10n.profile_pseudoTooLong;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mailController,
                decoration: InputDecoration(labelText: l10n.profile_emailLabel),
                readOnly: true,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: l10n.profile_phoneNumberLabel),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.profile_phoneNumberRequired;
                  }
                  if (value.length > 15) {
                    return l10n.profile_phoneNumberTooLong;
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
                      decoration: InputDecoration(labelText: l10n.profile_streetNumberLabel),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.profile_streetNumberRequired;
                        }

                        final number = int.tryParse(value);

                        if (number == null) {
                          return l10n.profile_streetNumberInvalid;
                        }

                        if (number < 1) {
                          return l10n.profile_streetNumberPositive;
                        }

                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _streetTypeController,
                      decoration: InputDecoration(labelText: l10n.profile_streetTypeLabel),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.profile_streetTypeRequired;
                        }

                        if (value.length > 10) {
                          return l10n.profile_streetTypeTooLong;
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _streetNameController,
                decoration: InputDecoration(labelText: l10n.profile_streetNameLabel),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.profile_streetNameRequired;
                  }

                  if (value.length > 50) {
                    return l10n.profile_streetNameTooLong;
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _addressComplementController,
                decoration: InputDecoration(labelText: l10n.profile_addressComplementLabel),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value != null && value.length > 50) {
                    return l10n.profile_addressComplementTooLong;
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
                      decoration: InputDecoration(labelText: l10n.profile_zipCodeLabel),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.profile_zipCodeRequired;
                        }

                        if (value.length > 10) {
                          return l10n.profile_zipCodeTooLong;
                        }

                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(labelText: l10n.profile_cityLabel),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.profile_cityRequired;
                        }

                        if (value.length > 50) {
                          return l10n.profile_cityTooLong;
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                autocorrect: false,
                enableSuggestions: false,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: l10n.profile_passwordLabel,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.profile_passwordRequired;
                  }
                  return null;
                },
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
                        content: Text(l10n.profile_implementationInProgressMessage),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: l10n.profile_saveChangesButton,
                          onPressed: () {
                            // TODO: implémenter l'appel API
                          },
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.save_outlined),
                  label: Text(l10n.profile_saveSnackBarAction),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.profile_implementationInProgressMessage),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: l10n.profile_logoutButton,
                          onPressed: () {
                            // TODO: implémenter le logout
                          },
                        ),
                      ),
                    ),
                  },
                  icon: Icon(Icons.logout),
                  label: Text(l10n.profile_logoutSnackBarAction),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
