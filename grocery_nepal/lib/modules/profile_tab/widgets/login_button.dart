import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import '../../../constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () {
        // Get.find<AppController>().login();
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return LoginScreen();
        // }));
        // Navigator.pushNamed(context, '/login');
        Get.to(() => LoginScreen());
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Stack(
          children: const [
            Center(
              child: Text(
                'Login',
                style: TextStyle(color: greenColor, fontSize: 17),
              ),
            ),
            Icon(
              Icons.login_outlined,
              color: greenColor,
            )
          ],
        ),
      ),
      color: Colors.grey.shade300,
      elevation: 0,
    );
  }
}
