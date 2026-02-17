import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';
import 'package:forms_app/shared/shared.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(size: 100),

              _RegisterForm(),

              const SizedBox(height: 20),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => registerCubit.usernameChange(value),
            errorMessage: username.errorMessage,
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => registerCubit.emailChange(value),
            errorMessage: email.errorMessage,
          ),

          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Contraseña',
            obscuredText: true,
            onChanged: (value) => registerCubit.passwordChange(value),
            errorMessage: password.errorMessage,
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () => registerCubit.onSubmit(),
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
