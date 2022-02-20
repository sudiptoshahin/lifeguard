
import 'package:flutter/material.dart';
import 'package:lifeguard/app_strings.dart';
import 'package:lifeguard/pages/learn/learn.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../util/utils.dart';

class VideoLink3 extends StatefulWidget {
  const VideoLink3({Key? key}) : super(key: key);

  @override
  _VideoLink3State createState() => _VideoLink3State();
}

class _VideoLink3State extends State<VideoLink3> {
  int _currentIndex = 3;

  late WebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => new Learn()));
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Learn()));
          },),
        ),
        body: WebView(
          initialUrl: 'https://youtu.be/KSl5Id3Is1U',
          // Enable Javascript on WebView
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewController){
            this.webViewController = webViewController;
          },
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF270000),
          child: Icon(Icons.refresh, color: Colors.white70, size: 30, ),
          onPressed: (){
            webViewController.reload();
          },
        ),

        /** bottom-navigation **/
        bottomNavigationBar: Utils.appbar(context, _currentIndex),
      ),
    );
  }
}
