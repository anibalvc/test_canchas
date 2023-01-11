import 'package:test_canchas/core/locator.dart';
import 'package:test_canchas/core/providers.dart';
import 'package:test_canchas/core/router.dart';
import 'package:test_canchas/core/services/navigator_service.dart';
import 'package:test_canchas/theme/theme.dart';
import 'package:test_canchas/views/home/home_view.dart';
import 'package:test_canchas/widgets/no_scale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  /* Quitar barra de notificaciones */
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await LocatorInjector.setupLocator();
  await DependencyInjection.initialize();
  runApp(const MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        title: 'Control Bienes',
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigatorService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: HomeView.routeName,
        theme: myTheme,
        builder: (context, child) {
          return NoScaleTextWidget(
            child: child!,
          );
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', 'ES'),
          Locale('en', 'US'),
        ],
        locale: const Locale('es'),
      ),
    );
  }
}
