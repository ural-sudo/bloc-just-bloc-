import 'package:bloc_without_cubit/view/auth/login/viewModal/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  Color? color;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to Register Screen",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.amber, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _key,
                child: Column(
                  children: [
                    CustomFormField(
                      topText: "Email Field...",
                      customTextField: LoginCustomTextField(
                        controller: _emailController,
                        iconData: Icons.mail,
                        onchanged: (value) {},
                        validator: (value) {},
                        hinText: "Please Enter Email",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      topText: "Password Field...",
                      customTextField: LoginCustomTextField(
                        onchanged: (value) {
                          print(value);
                          return context
                              .read<RegisterBloc>()
                              .add(EnterPassword(value.length, true));
                        },
                        controller: _passwordController,
                        hinText: "Please Enter Password",
                        iconData: Icons.password,
                        obsecure: true,
                        validator: (value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        if(state.passWordLenght! <= 4){
                          color = Colors.red;
                        }else if(state.passWordLenght! > 4 && state.passWordLenght! <= 8){
                          color = Colors.yellow;
                        }else if(state.passWordLenght! > 8){
                          color = Colors.lightGreenAccent;
                        }
                        return state.isEnteredSomething == true
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  width: state.passWordLenght! * 10,
                                  height: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color:color,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buieldFormButton(
                      () {},
                      color ?? Colors.white
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox buieldFormButton(void Function() press, Color color) {
  return SizedBox(
    width: 300,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: press,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 18, color: Colors.amber),
        ),
      ),
    ),
  );
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.topText,
    required this.customTextField,
  }) : super(key: key);

  final String topText;
  final Widget customTextField;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            topText,
            style: const TextStyle(fontSize: 18, color: Colors.purple),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        customTextField
      ],
    );
  }
}

class LoginCustomTextField extends StatelessWidget {
  LoginCustomTextField({
    Key? key,
    required this.controller,
    required this.iconData,
    required this.validator,
    required this.hinText,
    required this.onchanged,
    this.obsecure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData iconData;
  final String hinText;
  final void Function(String value)? onchanged;
  bool? obsecure;
  String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure ?? false,
      obscuringCharacter: "*",
      onChanged: onchanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: buildTextFormFieldBorder(),
        focusedBorder: buildTextFormFieldBorder(),
        hintText: hinText,
        suffixIcon: Icon(
          iconData,
          color: Colors.purple,
        ),
      ),
      validator: validator,
      controller: controller,
    );
  }
}

OutlineInputBorder buildTextFormFieldBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(width: 2.5, color: Colors.purple),
    borderRadius: BorderRadius.circular(20),
  );
}
