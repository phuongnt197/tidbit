import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/hompage_mainview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff00B195),
        ),
        centerTitle: true,
        elevation: 0.0,
        shadowColor: const Color(0xff1f4007),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff1f4007),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Color(0xff00B195),
            ),
            onPressed: () {
              if (kDebugMode) {
                print('search button is clicked');
              }
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Tester'),
              accountEmail: Text('tester@tidbit.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/eevee.png'),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Color(0xff00B195),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.save,
                color: Color(0xff00B195),
              ),
              title: const Text('Intake Records'),
              onTap: () {
                Navigator.pushNamed(context, "/intake_records");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Color(0xff00B195),
              ),
              title: const Text('Goals'),
              onTap: () {
                Navigator.pushNamed(context, "/goals");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calculate_rounded,
                color: Color(0xff00B195),
              ),
              title: const Text('BMI Calculation'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Color(0xff00B195),
              ),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pushNamed(context, "/my_profile");
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: HomePageMainView(),
        ),
      ),
    );
  }
}
