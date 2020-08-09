import 'package:flutter/material.dart';
import 'package:covid19/services/NetworkHelper.dart';

//Import news article screen
import 'news_article.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  Future <List> getData() async {
    NetworkHelper covidData = NetworkHelper(
        'http://newsapi.org/v2/top-headlines?country=in&q=corona&sortBy=publishedAt&apiKey=d9fa391aacfe428e81b8c6002ea8a507');
    var covidNews = await covidData.getData();
    var articles = covidNews['articles'];
    print(articles);

    return articles;
  }


  void initState() {
    super.initState();
    getData();
  }

  Future<Null> refresh() async{
    await getData();
    setState(() {

    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data == null){
            return
                Container(
                  child: Center(
                    child: Text('Loading...'),
                  )
                );
          }
          else{
            return RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsArticle(newsURL: snapshot.data[index]['url'],newsSource: snapshot.data[index]['source']['name'],newsTitle: snapshot.data[index]['title'],newsDescription: snapshot.data[index]['description'],),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.blueAccent.withOpacity(0.5),

                        child: SizedBox(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.network(
                                      snapshot.data[index]['urlToImage'],
                                      scale: 1,
                                      fit: BoxFit.cover
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                                    child: Text(
                                        snapshot.data[index]['title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            letterSpacing: 1.2,
                                            color: Colors.white
                                        ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ),
                      ),
                    );
                  }
              ),
            );
          }
          }

      )
    );
  }
}
//TODO: Integrate news page