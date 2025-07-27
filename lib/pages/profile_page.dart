import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/pages/dashboard_page.dart';
import 'package:grocery_app/pages/wishlist_page.dart';
import 'package:grocery_app/utils/shared_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required fullName, required email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // var loginDetails = await SharedService.LoginDetails();
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                radius: 80.0,
                backgroundImage:
                    NetworkImage('https://example.com/profile_image.png'),
                child: Icon(Icons.person, size: 80.0, color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Nitin Kumar",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(10.0),
                      width: 200.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined,
                              color: Colors.white),
                          SizedBox(width: 10.0),
                          Text(
                            'Your Orders',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: GestureDetector(
                        child: Container(
                      padding: EdgeInsets.all(5.0),
                      width: 200.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite, color: Colors.white),
                            SizedBox(width: 10.0),
                            Text(
                              'Your Wishlist',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return WishlistPage();
                            }),
                          );
                        },
                      ),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Name:"),
                    Text(
                      "Nitin Kumar",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ]),
              SizedBox(
                height: 20.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Email:"),
                    Text(
                      "nitin@gmail.com",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ]),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/login", (routes) => false);
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
