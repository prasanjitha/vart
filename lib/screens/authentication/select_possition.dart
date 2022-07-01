import 'package:flutter/material.dart';
import 'package:vart/widgets/custom_button.dart';

import 'login_page.dart';

class SelectPossition extends StatelessWidget {
  const SelectPossition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 280.0,top: 20.0),
                child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
              ),
              const SizedBox(height: 80.0),
              Image.asset('assets/images/loading.png'),
              const SizedBox(height: 60.0),
              CustomColorButton(
                text: 'Admin',
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(
                        possition: 'admin',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              CustomColorButton(
                text: 'Buyer',
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(
                        possition: 'buyer',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              CustomColorButton(
                text: 'Seller',
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(
                        possition: 'seller',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
