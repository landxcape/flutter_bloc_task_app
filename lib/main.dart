import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_tasks_app/screens/app.dart';
import 'package:flutter_tasks_app/services/app_router.dart';
import 'package:path_provider/path_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(Phoenix(
    child: App(
      appRouter: AppRouter(),
    ),
  ));
}
