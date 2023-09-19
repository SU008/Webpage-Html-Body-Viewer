//working
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;


//

class WebPageViewerAnriodPlathform extends StatefulWidget {
  final String url;

  const WebPageViewerAnriodPlathform({Key? key, required this.url})
      : super(key: key);

  @override
  State<WebPageViewerAnriodPlathform> createState() =>
      _WebPageViewerAnriodPlathformState();
}

class _WebPageViewerAnriodPlathformState
    extends State<WebPageViewerAnriodPlathform> {
  String _title = '';
  String _subheading = '';
  String _subheading2 = '';
  String _article = '';
  bool _isLoading = true; // Track loading state

  Future<void> _fetchHtml() async {
    final response = await http.get(Uri.parse(widget.url));
    if (response.statusCode == 200) {
      final document = parser.parse(response.body);
      final titleElement = document.querySelector('title');
      final subheadingElement = document.querySelector('h2');
      final subheadingElement2 = document.querySelector('h3');
      final articleElement = document.querySelector('article');
      if (titleElement != null) {
        setState(() {
          _title = titleElement.text;
        });
      }
      if (subheadingElement != null) {
        setState(() {
          _subheading = subheadingElement.text;
        });
      }

      if (subheadingElement2 != null) {
        setState(() {
          _subheading2 = subheadingElement2.text;
        });
      }
      if (articleElement != null) {
        final articleText = _extractPlainText(articleElement);
        setState(() {
          _article = articleText;
          _isLoading = false;
        });
      }
/*
      if (articleElement != null) {
        setState(() {
          _article = articleElement.innerHtml;
        });
      }

 */
    }
  }

  String _extractPlainText(dom.Element element) {
    final buffer = StringBuffer();

    void extractText(dom.Node node) {
      if (node is dom.Text) {
        buffer.write(node.text);
      } else if (node is dom.Element) {
        if (node.localName == 'p') {
          // Add a newline before each paragraph
          if (buffer.isNotEmpty) {
            buffer.write('\n\n'); // Add two newlines for a paragraph break
          }
        }
        for (final child in node.nodes) {
          extractText(child);
        }
      }
    }

    extractText(element);
    return buffer.toString();
  }

  @override
  void initState() {
    super.initState();
    _fetchHtml();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.url)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: _isLoading // Check loading state
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        _title,
                        //style: Theme.of(context).textTheme.titleLarge,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      if (_subheading.isNotEmpty) const SizedBox(height: 5),
                      Text(_subheading,
                          style: Theme.of(context).textTheme.titleMedium),
                      if (_subheading2.isNotEmpty) const SizedBox(height: 5),
                      Text(_subheading2,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 20),
                      Text(_article),
                      //Html(data: _article),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
