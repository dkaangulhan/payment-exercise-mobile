import 'package:flutter/material.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/models/user_address.dart';
import 'package:payment_exercise/models/user_model.dart';
import 'package:payment_exercise/use_cases/profile/models/update_profile_params.dart';
import 'package:payment_exercise/use_cases/profile/update_profile_use_case.dart';

/// This page is to edit the user's address.
class EditProfileAdressPage extends StatefulWidget {
  /// This page is to edit the user's address.
  const EditProfileAdressPage({
    required this.user,
    super.key,
  });

  /// User model.
  final UserModel user;

  @override
  State<EditProfileAdressPage> createState() => _EditProfileAdressPageState();
}

class _EditProfileAdressPageState extends State<EditProfileAdressPage> {
  final formKey = GlobalKey<FormState>();
  final contactNameController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final zipCodeController = TextEditingController();

  UserModel get user => widget.user;

  @override
  void initState() {
    super.initState();
    if (user.addressList != null && user.addressList!.isNotEmpty) {
      final address = user.addressList!.first;
      contactNameController.text = address.contactName;
      cityController.text = address.city;
      countryController.text = address.country;
      addressController.text = address.address;
      phoneController.text = address.phone ?? '';
      zipCodeController.text = address.zipCode;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            TextFormField(
              controller: contactNameController,
              decoration: const InputDecoration(labelText: 'Contact Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a contact name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a city';
                }
                return null;
              },
            ),
            TextFormField(
              controller: countryController,
              decoration: const InputDecoration(labelText: 'Country'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a country';
                }
                return null;
              },
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: zipCodeController,
              decoration: const InputDecoration(labelText: 'Zip Code'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a zip code';
                }
                return null;
              },
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                await _save(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final address = UserAddress(
        contactName: contactNameController.text,
        city: cityController.text,
        country: countryController.text,
        address: addressController.text,
        phone: phoneController.text,
        zipCode: zipCodeController.text,
      );

      await UpdateProfileUseCase(
        getit(),
        getit(),
        getit(),
      ).execute(
        params: UpdateProfileParams(
          addressList: [address],
        ),
        token: getit<SessionStore>().userSession.token!,
      );
      Navigator.of(context).pop();
    }
  }
}
