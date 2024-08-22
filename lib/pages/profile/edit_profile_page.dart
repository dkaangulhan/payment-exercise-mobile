import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exercise/common/getit.dart';
import 'package:payment_exercise/global_stores/session_store.dart';
import 'package:payment_exercise/use_cases/profile/models/update_profile_params.dart';
import 'package:payment_exercise/use_cases/profile/update_profile_use_case.dart';
import 'package:payment_exercise/widgets/update_field_dialog.dart';

/// Page for editing the profile.
class EditProfilePage extends StatefulWidget {
  /// Page for editing the profile.
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: getit<SessionStore>(),
      builder: (context, _) {
        final sessionStore = getit<SessionStore>();

        final user = sessionStore.user!;
        final name = user.name;
        final surname = user.surname;
        final email = user.email;
        final identityNumber = user.identityNumber;

        return Form(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Edit Profile'),
            ),
            body: ListView(
              children: [
                ListTile(
                  title: const Text('Name'),
                  subtitle: Text(name),
                  onTap: () {
                    // Show the dialog to update the name.
                    UpdateFieldDialog.show(
                      context: context,
                      initialValue: name,
                      title: 'Name',
                      onSaved: (String? value) async {
                        // Save the name.
                        await UpdateProfileUseCase(getit(), getit()).execute(
                          params: UpdateProfileParams(
                            name: value,
                          ),
                          token: sessionStore.userSession.token!,
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text('Surname'),
                  subtitle: Text(surname),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(email),
                ),
                ListTile(
                  title: const Text('Identity Number'),
                  subtitle: Text(identityNumber ?? 'Not set'),
                  onTap: () {
                    // Show the dialog to update the name.
                    UpdateFieldDialog.show(
                      context: context,
                      initialValue: identityNumber ?? 'Not set',
                      title: 'Identity Number',
                      onSaved: (String? value) async {
                        // Save the name.
                        await UpdateProfileUseCase(getit(), getit()).execute(
                          params: UpdateProfileParams(
                            identityNumber: value,
                          ),
                          token: sessionStore.userSession.token!,
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text('Addresses'),
                  onTap: () {
                    // Show the dialog to update the name.
                    context.go('/profile/edit/address');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
