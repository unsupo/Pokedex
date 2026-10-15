import 'package:flutter/material.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:provider/provider.dart';

/// App bar button showing the active profile's name. Tapping it opens
/// [ProfileSheet].
class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profiles, _) => TextButton.icon(
        key: const Key('profile-button'),
        icon: const Icon(Icons.person),
        label: Text(profiles.activeProfile.name),
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (_) => const ProfileSheet(),
        ),
      ),
    );
  }
}

enum _ProfileAction { rename, reset }

/// Lists profiles. Tapping one switches to it. Each row has a menu for rename
/// and reset, and the sheet ends with a "New profile" action.
class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profiles, _) {
        final activeId = profiles.activeProfileId;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text('Trainer profiles',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              for (final profile in profiles.profiles)
                ListTile(
                  leading: Icon(profile.id == activeId
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked),
                  title: Text(profile.name),
                  onTap: () => _switchTo(context, profile),
                  trailing: PopupMenuButton<_ProfileAction>(
                    key: Key('profile-menu-${profile.id}'),
                    onSelected: (action) =>
                        _runAction(context, profile, action),
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                          value: _ProfileAction.rename, child: Text('Rename')),
                      PopupMenuItem(
                          value: _ProfileAction.reset,
                          child: Text('Reset progress')),
                    ],
                  ),
                ),
              const Divider(),
              TextButton.icon(
                onPressed: () => _createProfile(context),
                icon: const Icon(Icons.add),
                label: const Text('New profile'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _switchTo(BuildContext context, Profile profile) async {
    await context.read<ProfileProvider>().setActive(profile.id);
    if (context.mounted) Navigator.pop(context);
  }

  Future<void> _createProfile(BuildContext context) async {
    final name = await _askForName(context,
        title: 'New profile', initialName: '', confirmLabel: 'Create');
    if (name == null || !context.mounted) return;
    await context.read<ProfileProvider>().createProfile(name);
    if (context.mounted) Navigator.pop(context);
  }

  Future<void> _runAction(
      BuildContext context, Profile profile, _ProfileAction action) async {
    switch (action) {
      case _ProfileAction.rename:
        final name = await _askForName(context,
            title: 'Rename profile',
            initialName: profile.name,
            confirmLabel: 'Save');
        if (name == null || !context.mounted) return;
        await context.read<ProfileProvider>().renameProfile(profile.id, name);
      case _ProfileAction.reset:
        final confirmed = await _confirmReset(context, profile);
        if (!confirmed || !context.mounted) return;
        await context.read<ProfileProvider>().resetProfile(profile.id);
    }
  }

  Future<String?> _askForName(
    BuildContext context, {
    required String title,
    required String initialName,
    required String confirmLabel,
  }) {
    return showDialog<String>(
      context: context,
      builder: (_) => _NameDialog(
        title: title,
        initialName: initialName,
        confirmLabel: confirmLabel,
      ),
    );
  }

  Future<bool> _confirmReset(BuildContext context, Profile profile) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Reset ${profile.name}?'),
        content: const Text(
            'This clears every caught Pokemon and card in this profile. '
            'The profile itself is kept.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }
}

class _NameDialog extends StatefulWidget {
  const _NameDialog({
    required this.title,
    required this.initialName,
    required this.confirmLabel,
  });

  final String title;
  final String initialName;
  final String confirmLabel;

  @override
  State<_NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<_NameDialog> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.initialName);
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final error = ProfileProvider.nameError(_controller.text);
    if (error != null) {
      setState(() => _error = error);
      return;
    }
    Navigator.pop(context, _controller.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(errorText: _error),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(widget.confirmLabel),
        ),
      ],
    );
  }
}
