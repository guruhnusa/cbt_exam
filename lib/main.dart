import 'package:cbt_exam/data/datasources/auth_local_datarsource.dart';
import 'package:cbt_exam/data/datasources/content_remote_datasource.dart';
import 'package:cbt_exam/data/datasources/materi_remote_datasource.dart';
import 'package:cbt_exam/data/datasources/onboarding_local_datasource.dart';
import 'package:cbt_exam/data/models/response/auth_response_model.dart';
import 'package:cbt_exam/presentation/auth/bloc/login/login_bloc.dart';
import 'package:cbt_exam/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:cbt_exam/presentation/auth/bloc/register/register_bloc.dart';
import 'package:cbt_exam/presentation/auth/pages/login_page.dart';
import 'package:cbt_exam/presentation/home/bloc/content/content_bloc.dart';
import 'package:cbt_exam/presentation/home/pages/dashboard_page.dart';
import 'package:cbt_exam/presentation/materi/bloc/materi/materi_bloc.dart';
import 'package:cbt_exam/presentation/onboarding/pages/onboarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => ContentBloc(
            ContentRemoteDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => MateriBloc(
            MateriRemoteDataSource(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'CBT APPS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<AuthResponseModel>(
            future: AuthLocalDataSource().getAuthData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const DashboardPage();
              } else {
                return FutureBuilder<bool>(
                    future: OnboardingLocalDataSource().getIsFirstTime(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!
                            ? const LoginPage()
                            : const OnboardingPage();
                      } else {
                        return const OnboardingPage();
                      }
                    });
              }
            }),
      ),
    );
  }
}
