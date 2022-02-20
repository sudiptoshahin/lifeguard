import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import '../../app_strings.dart';
import 'learn.dart';

class Book1 extends StatefulWidget {
  const Book1({Key? key}) : super(key: key);

  @override
  _Book1State createState() => _Book1State();
}

class _Book1State extends State<Book1> {

  int _currentIndex = 3;
  bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    _pdf = await PDFDocument.fromAsset('assets/books/first_aid_guide.pdf');

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