import 'package:brand_qr_scanner/views/Admin/adminaddaccountscreen.dart';
import 'package:brand_qr_scanner/views/Manufacturer/manufacturerhomescreen.dart';
import 'package:brand_qr_scanner/views/Manufacturer/manufacturerregisterproductscreen.dart';
import 'package:brand_qr_scanner/views/Manufacturer/manufacturerreportscreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:brand_qr_scanner/views/registerproductscreen.dart';
import 'package:brand_qr_scanner/views/profilescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../loginscreen.dart';
import '../../models/user.dart';
import 'manufacturerprofilescreen.dart';

class ManufacturerMainScreen extends StatefulWidget {
  final User user;
  const ManufacturerMainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ManufacturerMainScreen> createState() => _ManufacturerMainScreenState();
}

class _ManufacturerMainScreenState extends State<ManufacturerMainScreen> {
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "Profile";

  @override
  void initState() {
    super.initState();
    tabchildren = [
      const ManufacturerHomeScreen(),
      const ManufacturerRegisterProductScreen(),
      const ManufacturerReportScreen(),
      ManufacturerProfileScreen(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabchildren[_currentIndex],
      bottomNavigationBar: 
        CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Color(0xFF00E736),
          animationDuration: Duration(milliseconds: 300),
          onTap: onTabTapped,
          index: _currentIndex,
          items: const [
            Icon(
              Icons.house_rounded,
              color: Colors.white,
              size: 35,
            ),
            Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.white,
              size:35,
            ),
             Icon(
              Icons.insert_drive_file_outlined,
              color: Colors.white,
              size:35,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
              size:35,
            ),
          ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        maintitle = "Main";
      }
      if (_currentIndex == 1) {
        maintitle = "Register Product";
      }
       if (_currentIndex == 2) {
        maintitle = "Report";
      }
      if (_currentIndex == 3) {
        maintitle = "Profile";
      }
    });
  }
}