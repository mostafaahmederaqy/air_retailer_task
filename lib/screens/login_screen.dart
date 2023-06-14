import 'package:air_retailer_task/common_widgets/custom_button.dart';
import 'package:air_retailer_task/providers/auth_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common_widgets/custom_text_field.dart';
import '../main.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible=false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return Form(
      key:_formKey ,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  const SizedBox(height: 20,),

                  CustomTextField(

                    controller: emailController,
                    label: 'username/Email ID',
                    hint:'Enter username or email ID',
                    inputType: TextInputType.emailAddress, onValidate: (String? value) {
                      print(value);
                      if(value!.isEmpty){

                        return 'please enter email';
                      }
                      if(!EmailValidator.validate(value)){
                        return 'please enter valid email';
                      }
                      return null;
                  },
                  ),
                  CustomTextField(
                    passwordVisible:passwordVisible,
                    onVisibleIconTap: (){
                      setState(
                            () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                    onValidate: (value) => value!.length < 6
                        ? "Please enter a password with 6+ chars long"
                        : null,
                    isPassword: true,
                    controller: passwordController,
                    label: 'password',
                    hint:'password',
                    inputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 45,),

                  authProvider.status == Status.authenticating?const Center(child: CircularProgressIndicator()):CustomButton(
                    onTap: ()async{
                      if(_formKey.currentState!.validate()){
                        FocusScope.of(context)
                            .unfocus();
                        bool status  =await authProvider.signInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                        if (!status) {
                          final _context = MyApp.navKey.currentContext;
                          const snackBar = SnackBar(
                            content: Text('Invalid email and/or password'),

                          );


                          ScaffoldMessenger.of(_context!).showSnackBar(snackBar);


                        }
                      }
                    },
                    color: const Color(0xffFF0065),
                    textColor: Colors.white,
                    label:'Submit' ,
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      emailController.clear();
                      passwordController.clear();
                      FocusScope.of(context)
                          .unfocus();
                      Navigator.pushNamed(context, '/register');
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Not registered yet?  ',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(text: 'create an account',style: TextStyle(
                            color: Color(0xff73A4FF),
                              fontWeight: FontWeight.w500
                          )),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
