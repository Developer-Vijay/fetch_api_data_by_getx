import 'package:fetch_api_data/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class EmailValidation extends StatelessWidget {
  EmailValidation({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController();
  var storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Email Validation")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (GetUtils.isEmail(_emailController.text)) {
                      storage.write("email", _emailController.text);
                    } else {
                      Get.snackbar("incorrect email",
                          "Please Write the Valid email id",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: const Text("Write")),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print("The Email is ${storage.read("email")}");
                },
                child: const Text("Read")),
          ]),
    );
  }
}

/*
It is used for persistent key/value storage
can store string , int , double,map and list

// to list for changes
// var listen = storage.listen(() { print("Email Changed");});

// strage.removeListen(listen);
// to listen for change in key
// storage.listenkey('email',(value)){
// print('new key is $value');}

// Remove a key
stroage.remove('email');

// erase the container
storage.erase();

// create container with a name

GetStorage g= GetStorage('StorageName');
await GetStorage.init('StorageName'); // iniliaze

*/
