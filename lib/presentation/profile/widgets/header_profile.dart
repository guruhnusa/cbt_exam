import 'package:cbt_exam/core/extensions/build_context_ext.dart';
import 'package:cbt_exam/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:cbt_exam/presentation/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../data/datasources/auth_local_datarsource.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          child: Image.network(
            'https://i.pravatar.cc/200',
            width: 64.0,
            height: 64.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16.0),
        SizedBox(
          width: context.deviceWidth - 208.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: AuthLocalDataSource().getAuthData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        width: context.deviceWidth - 208.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.user.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              snapshot.data!.user.email,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  })
            ],
          ),
        ),
        const Spacer(),
        BlocConsumer<LogoutBloc, LogoutState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                success: (state) {
                  AuthLocalDataSource().removeAuthData();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state),
                    backgroundColor: Colors.green,
                  ));
                  context.pushReplacement(const LoginPage());
                },
                error: (state) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state),
                    backgroundColor: Colors.red,
                  ));
                });
          },
          builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return IconButton(
                onPressed: () async {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
                icon: Container(
                  width: 40.0,
                  height: 40.0,
                  padding: const EdgeInsets.all(10.0),
                  child: Assets.icons.logout.image(),
                ),
              );
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            });
          },
        ),
      ],
    );
  }
}
