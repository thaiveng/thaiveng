import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import '/screen/component/home/home_banner.dart';
import '/screen/main/home_screen.dart';
import '/theme/dark_theme_provider.dart';
import '/theme/styles.dart';
import '/util/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant/constant_string.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: 'Remote Config Example',
      home: FutureBuilder<FirebaseRemoteConfig>(
        future: setupRemoteConfig(),
        builder: (BuildContext context,
            AsyncSnapshot<FirebaseRemoteConfig> snapshot) {
          return snapshot.hasData
              ? WelcomeWidget(remoteConfig: snapshot.requireData)
              : Container();
        },
      )));
  // runApp(const MyApp());
}
class WelcomeWidget extends AnimatedWidget {
  WelcomeWidget({
    required this.remoteConfig,
  }) : super(listenable: remoteConfig);

  final FirebaseRemoteConfig remoteConfig;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Config Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${remoteConfig.getString('welcome')}'),
            const SizedBox(
              height: 20,
            ),
            Text('(${remoteConfig.getValue('welcome').source})'),
            Text('(${remoteConfig.lastFetchTime})'),
            Text('(${remoteConfig.lastFetchStatus})'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Using zero duration to force fetching from remote server.
            await remoteConfig.setConfigSettings(RemoteConfigSettings(
              fetchTimeout: const Duration(seconds: 10),
              minimumFetchInterval: Duration.zero,
            ));
            await remoteConfig.fetchAndActivate();
          } on PlatformException catch (exception) {
            // Fetch exception.
            print(exception);
          } catch (exception) {
            print(
                'Unable to fetch remote config. Cached or default values will be '
                'used');
            print(exception);
          }
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

Future<FirebaseRemoteConfig> setupRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.setDefaults(<String, dynamic>{
    'welcome': 'default welcome',
    'hello': 'default hello',
  });
  RemoteConfigValue(null, ValueSource.valueStatic);
  return remoteConfig;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: myName,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => MenuController(),
                ),
              ],
              child: const HomeScreen(
                children: [
                  HomeBanner(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
