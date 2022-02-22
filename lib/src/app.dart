import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../generated/l10n.dart';
import '../values/theme.dart';
import 'features/home/presentation/home_screen.dart';
import 'routes/routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      theme: AppTheme().applicationDefaultTheme(context),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: HomeScreen.routeName,
    );
  }
}
