import 'package:bloc_wall/ui/global/theme/app_themes.dart';
import 'package:bloc_wall/ui/global/theme/bloc/theme_bloc.dart';
import 'package:bloc_wall/ui/pages/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _themeBloc = kiwi.Container().resolve<ThemeBloc>();

  @override
  void dispose() {
    super.dispose();
    _themeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(
          title: 'Color Palette',
        ),
      ),
      body: _buildSettingsBody(),
    );
  }

  Widget _buildSettingsBody() {
    return ListView.builder(
      padding: EdgeInsets.all(18.9),
      itemCount: AppTheme.values.length,
      itemBuilder: (context, index) {
        final itemAppTheme = AppTheme.values[index];
        return Card(
          elevation: 5,
          color: appThemeData[itemAppTheme].primaryColor,
          child: ListTile(
            title: Text(
              itemAppTheme.toString(),
              style: appThemeData[itemAppTheme].textTheme.bodyText1,
            ),
            onTap: () {
              BlocProvider.of<ThemeBloc>(context)
                  .add(ThemeChanged(theme: itemAppTheme));
            },
          ),
        );
      },
    );
  }
}
