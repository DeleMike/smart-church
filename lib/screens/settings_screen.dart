import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

///screen is used to display user prefences options
class SettingsScreen extends StatefulWidget {
  static const routeName = 'settings';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 1.0),
      child: SettingsList(
        sections: [
          SettingsSection(
            title: 'Appearance',
            titleTextStyle: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: 14,
                ),
            tiles: [
              SettingsTile.switchTile(
                title: 'Dark Mode',
                leading: Icon(
                  Icons.bedtime_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                switchValue: _value,
                switchActiveColor: Theme.of(context).primaryColor,
                onToggle: (bool val) {
                  setState(() => _value = !_value);
                 // value = !val;
                  print('Settings: Dark Mode = $_value');
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            titleTextStyle: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: 14,
                ),
            tiles: [
              SettingsTile(
                title: 'Update profile',
                subtitle: 'change your biodata',
                leading: Icon(
                  Icons.person_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (ctx) {},
              ),
              SettingsTile(
                title: 'Phone Number',
                subtitle: 'add a new number',
                leading: Icon(
                  Icons.call_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (ctx) {},
              ),
              SettingsTile(
                title: 'Email',
                subtitle: 'change your email address',
                leading: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (ctx) {},
              ),
              SettingsTile(
                title: 'Sign out',
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (ctx) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            titleTextStyle: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: 14,
                ),
            tiles: [
              SettingsTile(
                title: 'Change password',
                leading: Icon(
                  Icons.lock_outline,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (ctx) {},
              ),
              SettingsTile(
                title: 'Use two-factor authentication',
                leading: Icon(
                  Icons.phonelink_lock,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (ctx) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Others',
            titleTextStyle: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: 14,
                ),
            tiles: [
              SettingsTile(
                title: 'Terms of Service and privacy',
                leading: Icon(
                  Icons.business_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: (ctx) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
