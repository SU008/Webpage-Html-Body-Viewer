import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Html_viewer.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  void _runButtonPressed() {
    String inputText = _textController.text;
    // Do something with the input text
    //print('Input Text: $inputText');

      Navigator.push(context, MaterialPageRoute(
        builder: (context) => WebPageViewerAnriodPlathform(url: inputText.toString()),),);
    //Navigator.of(context).pushNamed('/bypassed', arguments: inputText );

/*
    Navigator.pushReplacementNamed(context, '/bypassed', arguments: {
      'url': inputText.toString(),
    });

 */


  }

  void _pasteButtonPressed() async {
    ClipboardData? clipboardText = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardText != null) {
      setState(() {
        _textController.text = clipboardText.text!; // accessing the text property of the ClipboardData
      });
    }
  }

  void _clearButtonPressed() {
    setState(() {
      _textController.text = '';
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PayWall By-Pass'),
          centerTitle: true,
          leading: Container(),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                const SizedBox(height: 60),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SizedBox(height: 30),
                    Text(
                      "Copy & Paste the website URL\n ",

                      // Limit the text to 4 lines
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center, // Center the text
                      style: TextStyle(
                        fontSize: 20.0, // Reduce the font size
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),


                Row(//first row
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: 'Enter URL here',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(80, 57), // Set the minimum width and height
                        ),
                      ),
                      onPressed: _pasteButtonPressed,
                      child: const Text('Paste URL', textScaleFactor: 1),
                    ),
                  ],
                ),

                const SizedBox(height: 16.0),
                Row(//second row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [



                    ElevatedButton(
                      onPressed: _clearButtonPressed,

                      child: const Text('Clear'),
                    ),


                    ElevatedButton(
                      onPressed: _runButtonPressed,

                      child: const Text(
                        'Run',
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                      ),

                    ),









                  ],


                ),
                const SizedBox(height: 30),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SizedBox(height: 30),
                    Text(
                      "Use to Display the Html body content\n"
                          "of a webpage\n"
                          "Disclaimer: Not Guaranteed to work for all sites\n",
                      // Limit the text to 4 lines
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center, // Center the text
                      style: TextStyle(
                        fontSize: 15.0, // Reduce the font size
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}




