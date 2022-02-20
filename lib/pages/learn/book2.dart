

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:lifeguard/pages/learn/learn.dart';

import '../../app_strings.dart';
import '../../util/utils.dart';

class Book2 extends StatefulWidget {
  Book2({Key? key}) : super(key: key);

  @override
  _Book2State createState() => _Book2State();
}

class _Book2State extends State<Book2> {

  int _currentIndex = 3;
  bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    _pdf = await PDFDocument.fromAsset('assets/books/sports_injuries.pdf');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => new Learn()));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF270000),
          title: Text("Learn", style: AppStrings.title1Style()),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => new Learn()));
          },),
        ),
        body: Container(
          child: Center(
            child: _isLoading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _pdf),
          ),
        ),
      ),
    );
  }
}
