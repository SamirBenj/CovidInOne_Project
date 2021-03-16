import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'newsJson.dart';

class NewsPageInfo extends StatefulWidget {
  NewsPageInfo({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<NewsPageInfo> {
  bool loadingInProgess;
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      loadingInProgess = false;
    });
  }

  @override
  void initState() {
    loadingInProgess = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CovidNews',
          style: GoogleFonts.abrilFatface(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: loadingInProgess
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: ListView.builder(
                  itemCount: newslist.length,
                  //itemCount: 1,
                  itemBuilder: (context, index) {
                    return newslist == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25.0),
                                            topRight: Radius.circular(25.0),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                                newslist[index].urlToImage),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          newslist[index].title,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          /*style: GoogleFonts.abrilFatface(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),*/
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              newslist[index].publishedAt,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Spacer(),
                                            Flexible(
                                              child: Text(
                                                newslist[index].author,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.235,
                                    left: 15.0,
                                    child: Container(
                                      padding: EdgeInsets.all(4.0),
                                      color: Colors.green,
                                      child: Text(
                                        "Le Monde.fr",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
      ),
    );
  }
}
