import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

  @override
  Widget build(BuildContext context) {
    return _Chart();
  }
}

class _Chart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<_Chart> {
  @override
  void initState() {
    super.initState();
  }

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
              Navigator.pop(context);
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
              onTap: () {},
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Goals",
            style: TextStyle(
                color: Color(0xffFF8686),
                fontSize: 38,
                fontWeight: FontWeight.w500),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(10)),
          Center(
            child: SvgPicture.asset(
              'images/goals.svg',
              // height: 50.0,
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(10)),
          Container(
            width: 304,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: Color(0xff00b195),
            ),
            child: const Center(
              child: Text(
                "Lower sugar intake!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(10)),
          Container(
            width: 304,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: Color(0xff00b195),
            ),
            child: const Center(
              child: Text(
                "Eat more protein!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(10)),
          Container(
            width: 304,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: Color(0xff00b195),
            ),
            child: const Center(
              child: Text(
                "Drink more water!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const Padding(padding: EdgeInsetsDirectional.all(10)),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: Color(0xff00b195),
            ),
            child: IconButton(
              alignment: Alignment.center,
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
